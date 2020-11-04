package fr.inria.diverse.file;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Optional;

import fr.inria.diverse.benchmark.ARCHITECTURE;
import fr.inria.diverse.benchmark.AbstractBenchmark;
import fr.inria.diverse.benchmark.DEPLOYMENT_TYPE;
import fr.inria.diverse.benchmark.LANGUAGE;
import fr.inria.diverse.metrics.Record;
import fr.inria.diverse.trace.TraceHelper;

public class FileManager {
	
	public static Path createOutputs(String baseOutputFolder, String fileName, LANGUAGE lang, ARCHITECTURE architecture, DEPLOYMENT_TYPE deploymentType, int numberOfIterations, int numberOfVmInvocations) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss");
		Date date = new Date();
		String textDate = dateFormat.format(date);
		
		if(!Files.exists(Paths.get(baseOutputFolder))) {
			try {
				Files.createDirectory(Paths.get(baseOutputFolder));
			} catch (IOException e2) {
				e2.printStackTrace();
			}
		}
		
		String folder = baseOutputFolder + "/" + textDate;
		try {
			Files.createDirectory(Paths.get(folder));
		} catch (IOException e2) {
			e2.printStackTrace();
		}
		
		String repliesFolder = folder+"/replies";
		try {
			Files.createDirectory(Paths.get(repliesFolder));
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		String pcapFolder = folder+"/pcap";
		try {
			Files.createDirectory(Paths.get(pcapFolder));
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		StringBuffer content = new StringBuffer();
		content.append("service,document,requestId,start,end");
		content.append("\n");
		try {
			Files.write(Paths.get(folder+"/"+fileName), content.toString().getBytes());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		writeParametersToFiles(folder + "/metadata.txt", lang, architecture, deploymentType, numberOfIterations, numberOfVmInvocations);
		
		return Paths.get(folder);
	}
	
	public static Path createTraceOutputs(Path outputFolder) {

		StringBuffer content = new StringBuffer();
		content.append("service,document,requestId,router,storage,workspace,completion,definition,documentHightlight,documentSymbol,formatting,hover,references,rename,symbol,load_model");
		content.append("\n");
		Path detailsPath = Paths.get(outputFolder.toString(), "dataDurationsDetails.csv");
		try {
			Files.write(detailsPath, content.toString().getBytes());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return detailsPath;
	}
	
	public static void writeParametersToFiles(String filePath, LANGUAGE lang, ARCHITECTURE architecture, DEPLOYMENT_TYPE deploymentType, int numberOfIterations, int numberOfVmInvocations) {
		
		StringBuffer content = new StringBuffer();
		content.append("Language: " + lang+"\n");
		content.append("Architecture: " + architecture+"\n");
		content.append("Deployment type: " + deploymentType+"\n");
		content.append("Number of iterations: " + numberOfIterations+"\n");
		content.append("Number of VM invocations: " + numberOfVmInvocations+"\n");
		content.append("Timeout : " + AbstractBenchmark.TIMEOUT);
		content.append("\n");
		content.append("Wait time after open document: " + AbstractBenchmark.WAIT_TIME_AFTER_OPEN);
		
		try {
			Files.write(Paths.get(filePath), content.toString().getBytes());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static void appendToMetadata(String baseOutputFolder, double totalTime, Map<String,String> servicesToUrls) {
		
		Path file = Paths.get(baseOutputFolder + "/metadata.txt");
		
		StringBuffer content = new StringBuffer();
		content.append("\nBenchmark duration: " + totalTime + " seconds\n");
		for(Entry<String, String> entry : servicesToUrls.entrySet()) {
			content.append(entry.getKey() +" "+ entry.getValue()+"\n");
		}
		
		try {
			Files.write(file, content.toString().getBytes(), StandardOpenOption.APPEND);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static void appendToFile(Path file, Optional<Path> traceFile, Collection<Record> records) {
		
		StringBuffer content = new StringBuffer();
		StringBuffer contentDuration = new StringBuffer();
		
		for(Record record : records) {
			content.append(record.request.service + ",");
			content.append(record.request.fileUri+",");
			content.append(record.request.id+",");
			content.append(record.start+",");
			content.append(record.end+"\n");
			
			if(traceFile.isPresent()) {
				Map<String,Long> durations = TraceHelper.process(record.trace);
				long router = durations.getOrDefault("router",0L);
				long storage = durations.getOrDefault("storage",0L);
				long workspace = durations.getOrDefault("workspace",0L);
				long completion = durations.getOrDefault("completion",0L);
				long definition = durations.getOrDefault("definition",0L);
				long highlight = durations.getOrDefault("highlight",0L);
				long documentsymbol = durations.getOrDefault("documentsymbol",0L);
				long formatting = durations.getOrDefault("formatting",0L);
				long hover = durations.getOrDefault("hover",0L);
				long reference = durations.getOrDefault("references",0L);
				long rename = durations.getOrDefault("rename",0L);
				long symbol = durations.getOrDefault("symbol",0L);
				long load_model = durations.getOrDefault("load_model",0L);
				contentDuration.append(record.request.service+",");
				contentDuration.append(record.request.fileUri+",");
				contentDuration.append(record.request.id+",");
				contentDuration.append(router+",");
				contentDuration.append(storage+",");
				contentDuration.append(workspace+",");
				contentDuration.append(completion+",");
				contentDuration.append(definition+",");
				contentDuration.append(highlight+",");
				contentDuration.append(documentsymbol+",");
				contentDuration.append(formatting+",");
				contentDuration.append(hover+",");
				contentDuration.append(reference+",");
				contentDuration.append(rename+",");
				contentDuration.append(symbol+",");
				contentDuration.append(load_model+"\n");
			}
		}
		
		try {
			Files.write(file, content.toString().getBytes(), StandardOpenOption.APPEND);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		if(traceFile.isPresent()) {
			try {
				Files.write(traceFile.get(), contentDuration.toString().getBytes(), StandardOpenOption.APPEND);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void saveReplies(Path repliesFolder, Collection<Record> records) {
		for(Record record : records) {
			String service = record.request.service;
			String doc = documentSimpleName(record.request.fileUri);
			String fileName = repliesFolder.toString() + "/" + service + "_" + doc;
			try {
				if(!Files.exists(Paths.get(fileName))) {
					Files.write(Paths.get(fileName), record.reply.getBytes());
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	protected static String documentSimpleName(String document) {
		int slashPos = document.lastIndexOf("/");
		if(slashPos != -1) {
			return document.substring(slashPos+1);
		}
		return document;
	}
}
