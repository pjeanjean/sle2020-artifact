package fr.inria.diverse.benchmark;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import fr.inria.diverse.connection.RestManager;
import fr.inria.diverse.file.FileManager;
import fr.inria.diverse.metrics.RecordRegistry;
import fr.inria.diverse.request.Request;
import fr.inria.diverse.request.RequestFactory;

public class RestBenchmark extends AbstractBenchmark {
	
	public static final String DIAGRAM_URL = "http://localhost:30616/diagram";
	public static final String FORM_URL = "http://localhost:30428/form";
	
	public static final String INPUT_MODEL_FOLDER = "inputModels";

//	@Override
//	public List<String> getServices() {
//		return List.of(
//				"diagram",
//				"form"
//				);
//	}

	@Override
	public void benchmark(LANGUAGE lang, String service, String document, int numberOfTries, boolean isTraced, boolean isSavingReplies, Path outputFile, String storageUrl, String websocketUrl) {
//		List<String> services = List.of(service);
//		List<String> documents = List.of(document);
//		Map<String, List<Request>> requests = RequestFactory.createAllRequests(documents, services, numberOfTries);
//		
//		RestManager restManager = new RestManager();
//		
////		Path currentOutputFolder = FileManager.createOutputs(OUTPUT_FOLDER, "dataDurationsODWeb.csv");
////		Path outputFile = Paths.get(currentOutputFolder.toString(), "dataDurationsODWeb.csv");
//		
//		Optional<Path> outputTraceFile = Optional.empty();
////		if(isTraced) {
////			outputTraceFile = Optional.of(FileManager.createTraceOutputs(currentOutputFolder));
////		}
//		
//		for(String documentURI : sort(requests.keySet())) {
//			restManager.cleanRecordRegistry();
//			
//			Optional<String> documentContent = openFile(documentURI);
//			if(documentContent.isPresent()) {
//				restManager.append(requests.get(documentURI));
//				restManager.sendRequests(isTraced, documentContent.get());
//				
//				// Save results
//				RecordRegistry records = restManager.getRecordRegistry();
//				FileManager.appendToFile(outputFile, outputTraceFile, records.getRecords());
//			}
//		}
	}
}
