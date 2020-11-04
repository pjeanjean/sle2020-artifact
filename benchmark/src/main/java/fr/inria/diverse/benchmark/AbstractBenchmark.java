package fr.inria.diverse.benchmark;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

public abstract class AbstractBenchmark {
	
	public static final String STORAGE_URL = "http://localhost:30169/document";
	public static final String WEBSOCKET_URL = "ws://localhost:30320/lsp";
	public static final String JAEGER_URL = "http://localhost:16686";
	public static final String INPUT_FOLDER = "input2";
	public static final String OUTPUT_FOLDER = "output";
	public static final int NUMBER_OF_TRIES = 10;
	public static final long TIMEOUT = 3600000;
	public static final long WAIT_TIME_AFTER_INIT = 1000;
	public static final long WAIT_TIME_AFTER_OPEN = 1000;
	public static final boolean TRACED = true;
	

	public abstract void benchmark(LANGUAGE lang, String service, String document, int numberOfTries, boolean isTraced, boolean isSavingReplies, Path outputFile, String storageUrl, String websocketUrl);
	
	protected static Integer toSize(String fileName) {
		int separator = fileName.lastIndexOf("_");
		int ext = fileName.lastIndexOf(".");
		
		if(separator != -1 && ext != -1) {
			String sizeSuffix = fileName.substring(separator+1,ext);
			return Integer.parseInt(sizeSuffix);
		}
		
		return fileName.length(); //arbitrary number
	}
	
	public static Optional<String> openFile(String fileName) {
		
		String prefix = "inmemory:/";
		String realFileName = fileName.replace(prefix, "");
		
		try {
			byte[] bytes = Files.readAllBytes(Paths.get(realFileName));
			String content = new String(bytes, StandardCharsets.UTF_8);
			return Optional.of(content);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return Optional.empty();
	}
	
	protected static List<String> sort(Collection<String> documents) {
		return documents
			.stream()
			.sorted( (a,b) -> toSize(a).compareTo(toSize(b)) )
			.collect(Collectors.toList());
	}
}
