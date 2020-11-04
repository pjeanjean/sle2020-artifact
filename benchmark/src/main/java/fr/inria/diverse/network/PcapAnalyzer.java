package fr.inria.diverse.network;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.stream.Collectors;
import java.util.Optional;

import org.json.JSONArray;
import org.json.JSONObject;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

//import fr.bmartel.pcapdecoder.PcapDecoder;
//import fr.bmartel.pcapdecoder.structure.types.IPcapngType;
//import fr.bmartel.pcapdecoder.structure.types.impl.EnhancedPacketHeader;
//import fr.bmartel.pcapdecoder.structure.types.impl.InterfaceDescriptionHeader;
//import fr.bmartel.pcapdecoder.structure.types.inter.IEnhancedPacketBLock;
//import fr.bmartel.pcapdecoder.structure.types.inter.ISectionHeaderBlock;
//import io.pkts.PacketHandler;
//import io.pkts.Pcap;
//import io.pkts.packet.Packet;
//import io.pkts.protocol.Protocol;

public class PcapAnalyzer {
	
	static final String DIDOPEN_PATTERN = "/workspace/didOpen";
	static final String DIDCLOSE_PATTERN = "/workspace/didClose";

	public static void main(String[] parms) {
//		PcapDecoder decoder = new PcapDecoder("output2/2019_09_18_12_13_04/pcap/completion_Glace2d_1.nabla.pcap");
//		decoder.decode();
//		
//		System.out.println(decoder.getSectionList().size());
//		
//		for(IPcapngType section : decoder.getSectionList()) {
//			
//			if (section instanceof ISectionHeaderBlock) {
//
//		        ISectionHeaderBlock s = (ISectionHeaderBlock) section;
//		    }
//			else if (section instanceof InterfaceDescriptionHeader) {
//				InterfaceDescriptionHeader i = (InterfaceDescriptionHeader) section;
//				System.out.println(i.getOptions().getInterfaceIpv4NetworkAddr());
//				System.out.println(i.getOptions().getInterfaceName());
//			}
//			else if (section instanceof IEnhancedPacketBLock) {
//				IEnhancedPacketBLock e = (IEnhancedPacketBLock) section;
//			}
//			
//			System.out.println(section);
//		}
//		
//		try {
//			Pcap pcap = Pcap.openStream("output2/2019_09_18_12_13_04/pcap/completion_Glace2d_1.nabla-2.pcap");
//			pcap.loop(new PacketHandler() {
//				
//				@Override
//				public boolean nextPacket(Packet packet) throws IOException {
//					
//					System.out.println(packet.getName());
//					
//					return true;
//				}
//			});
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		
//		String file = "output2/2019_09_18_12_13_04/pcap/completion_Glace2d_1.nabla.pcap";
//		String file = "output2/2019_09_24_00_20_46/pcap/completion_Glace2d_1.nabla.pcap";
//		
//		List<String> args = new LinkedList<>();
//		args.add("tshark");
//		args.add("-r");
//		args.add(file);
//		args.add("-T");
//		args.add("json");
//		
//		String[] argArray = new String[args.size()];
//		args.toArray(argArray);
//		ProcessBuilder builder = new ProcessBuilder(argArray);
//		
//		StringBuffer sb = new StringBuffer();
//		try {
//			Process proc = builder.start();
//			InputStream inputStream = proc.getInputStream();
//			try (BufferedReader in = new BufferedReader(new InputStreamReader(inputStream))) {
//				String line;
//				while ((line = in.readLine()) != null) {
//					sb.append(line); // append \n after ?
//				}
//			}
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		
////		System.out.println(sb.toString());
//		
//		JsonArray array = new JsonParser().parse(sb.toString()).getAsJsonArray();
//		System.out.println("Number of frames: "+ array.size());
//		
//		for(JsonElement item : array) {
//			JsonObject source = item.getAsJsonObject().get("_source").getAsJsonObject();
//			JsonObject layers = source.get("layers").getAsJsonObject();
//			if(layers.has("http")) {
//				JsonObject tcp = layers.get("tcp").getAsJsonObject();
//				JsonObject http = layers.get("http").getAsJsonObject();
////				System.out.println(http);
//
////				JsonObject frame = layers.get("frame").getAsJsonObject();
////				int frameSize = frame.get("frame.len").getAsInt();
////				System.out.println("Frame size: "+frameSize +" bytes");
//				
//			}
//		}
//		
//		System.out.println("Number of service's frames: "+getServiceItems(array,"completion").size());
//		
//		List<String> services = List.of(
//				"completion",
//				"definition",
//				"documentsymbol",
//				"formatting",
//				"highlight",
//				"hover",
//				"references",
//				"rename",
//				"symbol"
//				);
//		for(String service : services) {
//			Map<String, Interval> intervals = new HashMap<>();
//			for(JsonObject item : getServiceItems(array,service)) {
////			System.out.println(item);
//				JsonObject source = item.getAsJsonObject().get("_source").getAsJsonObject();
//				JsonObject layers = source.get("layers").getAsJsonObject();
//				if(layers.has("http")) {
//					JsonObject tcp = layers.get("tcp").getAsJsonObject();
//					JsonObject http = layers.get("http").getAsJsonObject();
//					JsonObject frame = layers.get("frame").getAsJsonObject();
//					BigDecimal time = frame.get("frame.time_epoch").getAsBigDecimal();
//					
//					if(isRequest(http)) {
//						Interval newInterval = createInterval(item);
//						intervals.put(newInterval.uri, newInterval);
//					}
//					else if(isReply(http)) {
//						String uri = http.get("http.response_for.uri").getAsString();
//						Interval interval = intervals.get(uri);
//						completeInterval(interval, item);
//					}
//				}
//			}
//			for(Interval interval : intervals.values()) {
//				System.out.println(interval.name + " " + interval.duration);
//			}
//		}
//		
////		JSONArray json = new JSONArray(sb.toString());
////		System.out.println(json);
		
		StringBuffer resultDurations = new StringBuffer();
		resultDurations.append("service,document,storage,completion,definition,documentsymbol,formatting,highlight,hover,rename,references,symbol,workspace\n");
		
		StringBuffer resultLength = new StringBuffer();
		resultLength.append("service,document,storage.request,storage.reply,completion.request,completion.reply,definition.request,definition.reply,documentsymbol.request,documentsymbol.reply,formatting.request,formatting.reply,highlight.request,highlight.reply,hover.request,hover.reply,rename.request,rename.reply,references.request,references.reply,symbol.request,symbol.reply,workspace.request,workspace.reply\n");

		processFolder("output2/2019_09_24_00_20_46/pcap", resultDurations, resultLength);
		
		String serviceDurationDetails = "serviceDurationDetails.csv";
		try {
			if(!Files.exists(Paths.get(serviceDurationDetails))) {
				Files.write(Paths.get(serviceDurationDetails), resultDurations.toString().getBytes());
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		String serviceSizeDetails = "serviceSizeDetails.csv";
		try {
			if(!Files.exists(Paths.get(serviceSizeDetails))) {
				Files.write(Paths.get(serviceSizeDetails), resultLength.toString().getBytes());
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		System.out.println("DONE");
	}
	
	public static void processFolder(String folder,  StringBuffer resultDurations, StringBuffer resultLength) {
		List<String> files = getFiles(folder);
		
		files.sort(Comparator.comparingInt(PcapAnalyzer::getSize));
		
		for(String file : files) {
			System.out.println(file);
			processFile(file, resultDurations,resultLength);
		}
	}
	
	public static void processFile(String file, StringBuffer resultDurations, StringBuffer resultLength) {
		JsonArray frames = decodeFile(file);
		
		List<String> services = List.of(
				"completion",
				"definition",
				"documentSymbol",
				"formatting",
				"highlight",
				"hover",
				"references",
				"rename",
				"symbol"
				);
		
		Map<String, Interval> intervals = new HashMap<>();
		for(String service : services) {
			for(JsonObject item : getServiceItems(frames,service)) {
//			System.out.println(item);
				JsonObject source = item.getAsJsonObject().get("_source").getAsJsonObject();
				JsonObject layers = source.get("layers").getAsJsonObject();
				if(layers.has("http")) {
					JsonObject tcp = layers.get("tcp").getAsJsonObject();
					JsonObject http = layers.get("http").getAsJsonObject();
					JsonObject frame = layers.get("frame").getAsJsonObject();
					BigDecimal time = frame.get("frame.time_epoch").getAsBigDecimal();
					
					if(isRequest(http)) {
						Interval newInterval = createInterval(item);
						intervals.put(newInterval.uri, newInterval);
					}
					else if(isReply(http)) {
						String uri = http.get("http.response_for.uri").getAsString();
						Interval interval = intervals.get(uri);
						completeInterval(interval, item);
					}
				}
			}
		}
		
		Map<String,BigDecimal> durations = new HashMap<>();
		Map<String,Long> length = new HashMap<>();
		for(Interval interval : intervals.values()) {
			durations.put(interval.name,interval.duration);
			length.put(interval.name+".request", getLength(interval.request));
			length.put(interval.name+".reply", getLength(interval.reply));
//			System.out.println(interval.name + " " + interval.duration);
		}
		
//		String header = "service,document,storage,completion,definition,documentsymbol,formatting,highlight,hover,rename,references,symbol,workspace";

		String simpleFileName = getSimpleName(file);
		String service = getServiceName(simpleFileName);
		String document = getDocumentName(simpleFileName);
		
		BigDecimal storage = durations.getOrDefault("storage", new BigDecimal(0));
		BigDecimal completion = durations.getOrDefault("completion", new BigDecimal(0));
		BigDecimal definition = durations.getOrDefault("definition", new BigDecimal(0));
		BigDecimal documentsymbol = durations.getOrDefault("documentsymbol", new BigDecimal(0));
		BigDecimal formatting = durations.getOrDefault("formatting", new BigDecimal(0));
		BigDecimal highlight = durations.getOrDefault("highlight", new BigDecimal(0));
		BigDecimal hover = durations.getOrDefault("hover", new BigDecimal(0));
		BigDecimal rename = durations.getOrDefault("rename", new BigDecimal(0));
		BigDecimal references = durations.getOrDefault("references", new BigDecimal(0));
		BigDecimal symbol = durations.getOrDefault("symbol", new BigDecimal(0));
		BigDecimal workspace = durations.getOrDefault("workspace", new BigDecimal(0));
		
		String line = service+","+document+","+storage+","+completion+","+definition+","+documentsymbol+","+formatting+","+highlight+","+hover+","+rename+","+references+","+symbol+","+workspace;
		resultDurations.append(line);
		resultDurations.append("\n");
		
		Long storageRequest = length.getOrDefault("storage.request", new Long(0));
		Long storageReply = length.getOrDefault("storage.reply", new Long(0));
		Long completionRequest = length.getOrDefault("completion.request", new Long(0));
		Long completionReply = length.getOrDefault("completion.reply", new Long(0));
		Long definitionRequest = length.getOrDefault("definition.request", new Long(0));
		Long definitionReply = length.getOrDefault("definition.reply", new Long(0));
		Long documentsymbolRequest = length.getOrDefault("documentsymbol.request", new Long(0));
		Long documentsymbolReply = length.getOrDefault("documentsymbol.reply", new Long(0));
		Long formattingRequest = length.getOrDefault("formatting.request", new Long(0));
		Long formattingReply = length.getOrDefault("formatting.reply", new Long(0));
		Long highlightRequest = length.getOrDefault("highlight.request", new Long(0));
		Long highlightReply = length.getOrDefault("highlight.reply", new Long(0));
		Long hoverRequest = length.getOrDefault("hover.request", new Long(0));
		Long hoverReply = length.getOrDefault("hover.reply", new Long(0));
		Long renameRequest = length.getOrDefault("rename.request", new Long(0));
		Long renameReply = length.getOrDefault("rename.reply", new Long(0));
		Long referencesRequest = length.getOrDefault("references.request", new Long(0));
		Long referencesReply = length.getOrDefault("references.reply", new Long(0));
		Long symbolRequest = length.getOrDefault("symbol.request", new Long(0));
		Long symbolReply = length.getOrDefault("symbol.reply", new Long(0));
		Long workspaceRequest = length.getOrDefault("workspace.request", new Long(0));
		Long workspaceReply = length.getOrDefault("workspace.reply", new Long(0));
		
		String line2 = service+","+document+","+storageRequest+","+storageReply+","+completionRequest+","+completionReply+","+definitionRequest+","+definitionReply+","+documentsymbolRequest+","+documentsymbolReply+","+formattingRequest+","+formattingReply+","+highlightRequest+","+highlightReply+","+hoverRequest+","+hoverReply+","+renameRequest+","+renameReply+","+referencesRequest+","+referencesReply+","+symbolRequest+","+symbolReply+","+workspaceRequest+","+workspaceReply;
		resultLength.append(line2);
		resultLength.append("\n");
	}
	
	public static JsonArray decodeFile(String file) {
		List<String> args = new LinkedList<>();
		args.add("tshark");
		args.add("-r");
		args.add(file);
		args.add("-T");
		args.add("json");
		
		String[] argArray = new String[args.size()];
		args.toArray(argArray);
		ProcessBuilder builder = new ProcessBuilder(argArray);
		
		StringBuffer sb = new StringBuffer();
		try {
			Process proc = builder.start();
			InputStream inputStream = proc.getInputStream();
			try (BufferedReader in = new BufferedReader(new InputStreamReader(inputStream))) {
				String line;
				while ((line = in.readLine()) != null) {
					sb.append(line); // append \n after ?
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return new JsonParser().parse(sb.toString()).getAsJsonArray();
	}
	
	/*
	 * Filter everything before /POST service and after /POST didClose
	 */
	public static List<JsonObject> getServiceItems(JsonArray items, String serviceName) {
		
		List<JsonObject> result = new LinkedList<>();
		
		
		boolean filter = true;
		for(JsonElement item : items) {
			JsonObject source = item.getAsJsonObject().get("_source").getAsJsonObject();
			JsonObject layers = source.get("layers").getAsJsonObject();
			if(layers.has("http")) {
				JsonObject tcp = layers.get("tcp").getAsJsonObject();
				JsonObject http = layers.get("http").getAsJsonObject();
				
				if(isServiceCall(http,serviceName)) {
					filter = false;
					result.add(item.getAsJsonObject());
				}
				else if(isDidClose(http)) {
					filter = true;
				}
				else if(!filter) {
					result.add(item.getAsJsonObject());
				}
			}
		}
		
		return result;
	}
	
	public static  boolean isDidClose(JsonObject http) {
		for(Entry<String, JsonElement> entry : http.entrySet()) {
			if(entry.getKey().contains(DIDCLOSE_PATTERN)) {
				return true;
			}
		}
		return false;
	}
	
	public static boolean isServiceCall(JsonObject http, String serviceName) {
		for(Entry<String, JsonElement> entry : http.entrySet()) {
			if(entry.getKey().contains("/"+serviceName)) {
				return true;
			}
		}
		return false;
	}
	
	public static Interval createInterval(JsonObject item) {
		
		Interval res = new Interval();
		
		JsonObject source = item.getAsJsonObject().get("_source").getAsJsonObject();
		JsonObject layers = source.get("layers").getAsJsonObject();
		JsonObject frame = layers.get("frame").getAsJsonObject();
		JsonObject http = layers.get("http").getAsJsonObject();
		
		res.request = item;
		res.uri = http.get("http.request.full_uri").getAsString();
		res.name = getName(res.uri);
		res.start = frame.get("frame.time_epoch").getAsBigDecimal();
		
		return res;
	}
	
	public static void completeInterval(Interval interval, JsonObject item) {
		JsonObject source = item.getAsJsonObject().get("_source").getAsJsonObject();
		JsonObject layers = source.get("layers").getAsJsonObject();
		JsonObject frame = layers.get("frame").getAsJsonObject();
		
		interval.reply = item;
		interval.end = frame.get("frame.time_epoch").getAsBigDecimal();
		interval.duration = interval.end.subtract(interval.start);
	}
	
	public static boolean isRequest(JsonObject http) {
		return http.has("http.request.full_uri");
	}
	
	public static boolean isReply(JsonObject http) {
		return http.has("http.response_for.uri");
	}
	
	public static String getName(String uri) {
		if(uri.contains("completion")) {
			return "completion";
		}
		else if(uri.contains("definition")) {
			return "definition";
		}
		else if(uri.contains("documentSymbol")) {
			return "documentsymbol";
		}
		else if(uri.contains("formatting")) {
			return "formatting";
		}
		else if(uri.contains("hover")) {
			return "hover";
		}
		else if(uri.contains("highlight")) {
			return "highlight";
		}
		else if(uri.contains("rename")) {
			return "rename";
		}
		else if(uri.contains("references")) {
			return "references";
		}
		else if(uri.contains("symbol")) {
			return "symbol";
		}
		else if(uri.contains("document")) {
			return "storage";
		}
		else if(uri.contains("workspace")) {
			return "workspace";
		}
		
		return "noname";
	}
	
	public static List<String> getFiles(String inputFolder) {
		try {
			return Files.list(Paths.get(inputFolder)).map(it -> it.toString()).collect(Collectors.toList());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return new LinkedList<>();
	}
	
	public static String getSimpleName(String fileName) {
		
		int slashPos = fileName.lastIndexOf("/");
		if(slashPos != -1) {
			return fileName.substring(slashPos+1);
		}
		
		return fileName;
	}
	
	public static String getServiceName(String simpleFileName) {
		
		int underPos = simpleFileName.indexOf("_");
		if(underPos != -1) {
			return simpleFileName.substring(0, underPos);
		}
		
		return simpleFileName;
	}
	
	public static String getDocumentName(String simpleFileName) {
		
		int underPos = simpleFileName.indexOf("_");
		if(underPos != -1) {
			return simpleFileName.substring(underPos+1);
		}
		
		return simpleFileName;
	}
	
	public static int getSize(String fileName) {
		int underPos = fileName.lastIndexOf("_");
		int dotPos = fileName.lastIndexOf(".nabla");
		
		String numberPart = fileName.substring(underPos+1,dotPos);
		
		return Integer.parseInt(numberPart);
	}
	
	public static Long getLength(JsonObject item) {
		
		if(item == null) {
			return new Long(0);
		}
		
		JsonObject source = item.getAsJsonObject().get("_source").getAsJsonObject();
		JsonObject layers = source.get("layers").getAsJsonObject();
		JsonObject frame = layers.get("frame").getAsJsonObject();
		
		return frame.get("frame.len").getAsLong();
	}
	
}
