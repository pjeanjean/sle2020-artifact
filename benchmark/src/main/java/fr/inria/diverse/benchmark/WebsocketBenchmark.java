package fr.inria.diverse.benchmark;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import fr.inria.diverse.connection.RestManager;
import fr.inria.diverse.connection.WebsocketManager;
import fr.inria.diverse.file.FileManager;
import fr.inria.diverse.metrics.RecordRegistry;
import fr.inria.diverse.request.Request;
import fr.inria.diverse.request.RequestFactory;

public class WebsocketBenchmark extends AbstractBenchmark {
	
	@Override
	public void benchmark(LANGUAGE lang, String service, String document, int numberOfTries, boolean isTraced, boolean isSavingReplies, Path outputFile, String storageUrl, String websocketUrl) {
		
		List<String> services = List.of(service);
		List<String> documents = List.of(document);
		Map<String, List<Request>> requests = RequestFactory.createAllRequests(lang, documents, services, numberOfTries);
		
//		System.out.println("[DEBUG] Open websocket on " + websocketUrl +"/lsp");
		WebsocketManager websocketManager = new WebsocketManager(websocketUrl+"/lsp", isTraced);
		
//		Path currentOutputFolder = FileManager.createOutputs(OUTPUT_FOLDER, "dataDurations.csv");
//		Path outputFile = Paths.get(currentOutputFolder.toString(), "dataDurations.csv");
		
		Optional<Path> outputTraceFile = Optional.empty();
		if(isTraced) {
			String outputDetailsFile = outputFile.toString().replace("dataDurations.csv", "dataDurationsDetails.csv");
			outputTraceFile = Optional.of(Paths.get(outputDetailsFile));
		}
		
		for(String documentURI : sort(requests.keySet())) {
			
//			System.out.println("[DEBUG] "+documentURI);

			websocketManager.cleanRecordRegistry();
			
			Optional<String> documentContent = openFile(documentURI);
			if(documentContent.isPresent()) {
				if(storageUrl != null) {
					System.out.println("[DEBUG] Save to storage at: "+ storageUrl);
					RestManager.sendHttpPost(storageUrl+"/update?name="+documentURI, documentContent.get());
				}
				
				websocketManager.init(WAIT_TIME_AFTER_INIT);
				websocketManager.openDocument(documentURI,WAIT_TIME_AFTER_OPEN);
				benchmarkDocument(requests.get(documentURI), websocketManager);
				websocketManager.closeDocument(documentURI);
				
				// Save results
				RecordRegistry records = websocketManager.getRecordRegistry();
				FileManager.appendToFile(outputFile, outputTraceFile, records.getRecords());
				
				if(isSavingReplies) {
					String baseOutputFolder = outputFile.toString();
					String repliesOutputFolder = baseOutputFolder.replace("dataDurations.csv", "replies");
					FileManager.saveReplies(Paths.get(repliesOutputFolder), records.getRecords());
				}
			}
		}
		
		websocketManager.close();
		
	}
	
	public static void benchmarkDocument(List<Request> requests, WebsocketManager websocketManager) {
		websocketManager.append(requests);
		websocketManager.sendRequests(TIMEOUT);
	}
}
