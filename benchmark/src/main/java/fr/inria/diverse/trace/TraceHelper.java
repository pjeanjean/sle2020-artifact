package fr.inria.diverse.trace;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

import org.json.JSONArray;
import org.json.JSONObject;

import fr.inria.diverse.benchmark.AbstractBenchmark;

public class TraceHelper {
	
	static final String LOAD_SPAN = "load_model";
	
	public static Optional<String> getTrace(String service) {
		try {
			URL url = new URL(AbstractBenchmark.JAEGER_URL+"/api/traces?limit=1&lookback=1h&service="+service);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String inputLine;
			StringBuffer content = new StringBuffer();
			while ((inputLine = in.readLine()) != null) {
				content.append(inputLine+"\n");
			}
			in.close();
			con.disconnect();
			return Optional.of(content.toString());
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return Optional.empty();
	}
	
	public static Map<String, Long> process(String trace) {

		Map<String, Long> procToDuration = new HashMap<>();

		try {
			List<Span> allSpans = new ArrayList<>();
			List<Process> allProcess = new ArrayList<>();

			JSONObject jsonObj = new JSONObject(trace);
			JSONArray data = jsonObj.getJSONArray("data");
			JSONObject traceObj = data.getJSONObject(0);
			JSONArray spans = traceObj.getJSONArray("spans");

			// Collect spans
			for (var i = 0; i < spans.toList().size(); i++) {
				JSONObject span = spans.getJSONObject(i);
				String id = span.getString("spanID");
				long duration = span.getLong("duration");
				String processId = span.getString("processID");
				String operationName = span.getString("operationName");
				allSpans.add(new Span(id, duration, processId,operationName));
			}

			// Build hierarchy
			for (int i = 0; i < spans.toList().size(); i++) {
				JSONObject span = spans.getJSONObject(i);
				String id = span.getString("spanID");
				Optional<Span> current = allSpans.stream().filter(it -> it.id.equals(id)).findFirst();

				JSONArray references = span.getJSONArray("references");
				for (int j = 0; j < references.toList().size(); j++) {
					JSONObject ref = references.getJSONObject(j);
					String type = ref.getString("refType");
					if (type.equals("CHILD_OF")) {
						String targetId = ref.getString("spanID");
						if (targetId != id) {
							Optional<Span> parent = allSpans.stream().filter(it -> it.id.equals(targetId)).findFirst();
							if (parent.isPresent()) {
								parent.get().getChildren().add(current.get());
							}
						}
					}
				}
			}

			// Collect processes
			JSONObject processes = traceObj.getJSONObject("processes");
			for(String key : processes.keySet() ) {
				JSONObject process = processes.getJSONObject(key);
				String service = process.getString("serviceName");
				allProcess.add(new Process(key, service));
			}

			// Ignore sub span of the same process
			Set<Span> spanToIgnore = new HashSet<>();
			for(Span span : allSpans) {
				String process = span.processId;
				spanToIgnore.addAll(span.children.stream().filter(it -> it.processId.equals(process)).collect(Collectors.toList()));
			}

			// Compute result
			for(Process proc : allProcess) {
				List<Span> procSpan = allSpans.stream().filter(it -> it.processId.equals(proc.id)).filter(it -> !spanToIgnore.contains(it)).collect(Collectors.toList());
				List<Long> durations = procSpan.stream().map(span -> {
					long subDuration = getSubSpan(span).stream().map(it -> it.duration).reduce(0L, (l,r) -> l+r);
					return span.duration - subDuration;
				}).collect(Collectors.toList());
				Long procDuration = durations.stream().reduce(0L, (l,r) -> l+r);
				if(procToDuration.get(proc.service) != null) {
					System.out.print("  Already exist !");
				}
				procToDuration.put(proc.service, procDuration);
			}
			
			Optional<Span> loadSpan = allSpans.stream().filter(span -> span.operationName.equals(LOAD_SPAN)).findFirst();
			if(loadSpan.isPresent()) {
				procToDuration.put("load_model", loadSpan.get().duration);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return procToDuration;

	}
	
	/**
	 * Get direct sub span from a different process
	 */
	protected static List<Span> getSubSpan(Span root) {
		List<Span> res = new ArrayList<>();
		
		for(Span child : root.getChildren()) {
			if(child.processId != root.processId) {
				res.add(child);
			}
			else {
				res.addAll(getSubSpan(child));
			}
		}
		
		return res;
	}
}
