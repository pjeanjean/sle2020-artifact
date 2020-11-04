package fr.inria.diverse.connection;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.LinkedList;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.TimeUnit;

import org.json.JSONArray;

import fr.inria.diverse.benchmark.RestBenchmark;
import fr.inria.diverse.metrics.Record;
import fr.inria.diverse.metrics.RecordRegistry;
import fr.inria.diverse.request.Request;
import fr.inria.diverse.trace.TraceHelper;

public class RestManager {
	
	static final String DIAGRAM_DESCRIPTION_ID_PARAM = "diagramDescriptionId";
	
	LinkedList<Request> toProcess = new LinkedList<>();
	RecordRegistry recordRegistry = new RecordRegistry();
	
	public void append(List<Request> requests) {
		toProcess.addAll(requests);
	}
	
	public void sendRequests(boolean isTraced, String documentContent) {
		while(hasRequest()) {
			sendNext(isTraced, documentContent);
		}
	}
	
	protected void sendNext(boolean isTraced, String documentContent) {

		Request nextRequest = toProcess.pop();
		System.out.println("Bench "+nextRequest.service+" on "+nextRequest.fileUri);
		
		Record record = new Record(nextRequest, 0L, 0L);
		this.recordRegistry.addRecord(record);
		
		record.start = System.currentTimeMillis();
		Optional<String> url = getUrl(nextRequest);
		if(url.isPresent()) {
			
			System.out.println(url.get());
			Optional<String> reply = sendHttpPost(url.get(), documentContent);
			
			long end = System.currentTimeMillis();
			record.end = end;
			
			if(reply.isPresent()) {
				record.reply = reply.get();
			}
				
			if(isTraced) {
				try {
					TimeUnit.MILLISECONDS.sleep(1000);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
				Optional<String> trace = TraceHelper.getTrace(record.request.service);
				if(trace.isPresent()) {
					record.trace = trace.get();
				}
			}
		}
	}
	
	private Optional<String> getUrl(Request request) {

		if(request.service.equals("diagram")) {
			JSONArray params = request.message.getJSONArray("params");
			String diagramDescription = params.getString(0);
			return Optional.of(RestBenchmark.DIAGRAM_URL+"?diagramDescriptionId="+diagramDescription);
		}
		else if(request.service.equals("form")) {
			JSONArray params = request.message.getJSONArray("params");
			String objectId = params.getString(0);
			String formDescription = params.getString(1);
			return Optional.of(RestBenchmark.FORM_URL+"?objectId="+objectId+"&formDescriptionId="+formDescription);
		}
		
		return Optional.empty();
	}

	protected boolean hasRequest() {
		return !toProcess.isEmpty();
	}
	
	public RecordRegistry getRecordRegistry() {
		return recordRegistry;
	}
	
	public void cleanRecordRegistry() {
		recordRegistry = new RecordRegistry();
	}
	
	public static Optional<String> sendHttpPost(String url, String message) {
		Optional<String> reply = Optional.empty();
		try {
			URL _url = new URL(url);
			HttpURLConnection con = (HttpURLConnection) _url.openConnection();

			con.setRequestMethod("POST");
			con.setDoOutput(true);
			con.setRequestProperty("Content-Type", "text/plain");

			con.getOutputStream().write(message.getBytes("UTF-8"));
			con.getOutputStream().flush();
			con.getOutputStream().close();
			try {
				BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"));
				StringBuilder response = new StringBuilder();
				String responseLine = null;
				while ((responseLine = br.readLine()) != null) {
					response.append(responseLine.trim());
				}
				reply = Optional.of(response.toString());
			} catch (Exception e) {
				e.printStackTrace();
			}

			con.disconnect();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return reply;
	}
	
}
