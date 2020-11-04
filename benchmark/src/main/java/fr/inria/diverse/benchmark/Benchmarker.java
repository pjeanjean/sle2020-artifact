package fr.inria.diverse.benchmark;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

import fr.inria.diverse.deployment.Deployer;
import fr.inria.diverse.deployment.DockerDeployer;
import fr.inria.diverse.deployment.JvmDeployer;
import fr.inria.diverse.deployment.JvmXmiDeployer;
import fr.inria.diverse.deployment.KubernetesDeployer;
import fr.inria.diverse.deployment.NoneDeployer;
import fr.inria.diverse.file.FileManager;

/**
 * Entry point of the benchmarker
 * 
 * Configured by changing the values of the public static final attributes
 */
public class Benchmarker {
	
	public static final LANGUAGE LANG = LANGUAGE.Nabla; // config language
	public static final ARCHITECTURE ARCH = ARCHITECTURE.monolithic; // config monolith or distributed
	public static final DEPLOYMENT_TYPE DEPLOY_TYPE = DEPLOYMENT_TYPE.none; // deprecated, we expect that everything is already deployed 

	public static final String INTPUT_FOLDER = "inputNabla";
	public static final String OUTPUT_FOLDER = "outputNabla";
	public static final int NUMBER_OF_VM_INVOCATIONS = 1;
	public static final int NUMBER_OF_TRIES = 100;
 	
	public static final String WEBSOCKET_URL = "ws://localhost:8080";
	public static final String STORAGE_URL = null; // null for ARCHITECTURE.monolithic
	
	public static final boolean JAEGER_TRACING = false; // false ARCHITECTURE.monolithic, require configure AbstractBenchmark.JAEGER_URL
	public static final boolean CAPTURE_NETWORK = false; // deprecated
	public static final boolean SAVE_REPLIES = true;

	public static void main(String[] args) {
		
		DateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
		Date startDate = new Date();
		System.out.println("Start at : " + dateFormat.format(startDate));
		long start = System.currentTimeMillis();

		Map<String,String> usedServices = new HashMap<>();
		
		Path outputFile = createOutputFiles(LANG, ARCH, DEPLOY_TYPE);
		if(JAEGER_TRACING) {
			String baseOutputFolder = outputFile.toString().replace("dataDurations.csv", "");
			Path currentOutputFolder = Paths.get(baseOutputFolder);
			FileManager.createTraceOutputs(currentOutputFolder);
		}
		for(int i = 0; i < NUMBER_OF_VM_INVOCATIONS; i++) {
			Benchmarker bench = new Benchmarker();
			Map<String, String> benchServices = bench.launch(LANG, ARCH, DEPLOY_TYPE, CAPTURE_NETWORK, outputFile);
			usedServices.putAll(benchServices);
		}

		long end = System.currentTimeMillis();
		Date endDate = new Date();
		long duration = end - start;
		System.out.println("End at : " + dateFormat.format(endDate));
		System.out.println("Bench took: " + duration / 1000.0 + " seconds");
		
		String baseOutputFolder = outputFile.toString();
		baseOutputFolder = baseOutputFolder.replace("dataDurations.csv", "");
		FileManager.appendToMetadata(baseOutputFolder, duration / 1000.0, usedServices);
	}

	public Map<String,String> launch(LANGUAGE lang, ARCHITECTURE architecture, DEPLOYMENT_TYPE deploymentType, boolean networkMonitoring, Path outputFile) {
		
		Map<String,String> usedServices = new HashMap<>();

		WebsocketBenchmark benchmark = new WebsocketBenchmark();
		List<String> services = getServices();
		List<String> documents = getDocuments(INTPUT_FOLDER);

		for (String service : services) {
			for (String document : documents) {
				Optional<Deployer> deployer = createDeployer(deploymentType);
				if (deployer.isPresent()) {
					List<String> toDeploy = getDeployment(architecture, service);
					deployer.get().deploy(lang, toDeploy);
					String storageUrl = deployer.get().getServiceUrls().get("storage");
					String websocketUrl = deployer.get().getServiceUrls().get("router");
					if(architecture == ARCHITECTURE.monolithic) {
						websocketUrl = deployer.get().getServiceUrls().get("monolith");
					}
					
					if(networkMonitoring) {
						try {
							String baseOutputFolder = outputFile.toString();
							String dumpOutputFolder = baseOutputFolder.replace("dataDurations.csv", "pcap/");
							String dumpFile = dumpOutputFolder + service+"_"+documentSimpleName(document)+".pcap";
							Process netMonitorProc = getNetworkMonitoringBuilder(deployer.get(), dumpFile).start();
							
							if (websocketUrl != null && storageUrl != null) {
								benchmark.benchmark(lang, service, document, NUMBER_OF_TRIES, JAEGER_TRACING, SAVE_REPLIES, outputFile, storageUrl,
										websocketUrl);
							}
							
							Thread.sleep(500);
							netMonitorProc.destroy();
						} catch (IOException | InterruptedException e) {
							e.printStackTrace();
						}
					}
					else {
						if (websocketUrl != null && (storageUrl != null || architecture == ARCHITECTURE.monolithic) ) {
							benchmark.benchmark(lang, service, document, NUMBER_OF_TRIES, JAEGER_TRACING, SAVE_REPLIES, outputFile, storageUrl,
									websocketUrl);
						}
					}
					
					usedServices.putAll(deployer.get().getServiceUrls());
					deployer.get().destroyAll();
				}
			}
		}
		
		return usedServices;
	}

	protected static Path createOutputFiles(LANGUAGE lang, ARCHITECTURE architecture, DEPLOYMENT_TYPE deploymentType) {
		Path currentOutputFolder = FileManager.createOutputs(OUTPUT_FOLDER, "dataDurations.csv", lang, architecture, deploymentType, NUMBER_OF_TRIES, NUMBER_OF_VM_INVOCATIONS);
		return Paths.get(currentOutputFolder.toString(), "dataDurations.csv");
	}

	protected List<String> getDeployment(ARCHITECTURE deployment, String service) {
		List<String> toDeploy = new LinkedList<>();

		if (deployment.equals(ARCHITECTURE.monolithic)) {
			toDeploy.add("monolith");
		} else if (deployment.equals(ARCHITECTURE.distributed)) {
			toDeploy.add("router");
			toDeploy.add("storage");
			toDeploy.add("workspace");
			toDeploy.add(service);
		}

		return toDeploy;
	}

	protected Optional<Deployer> createDeployer(DEPLOYMENT_TYPE deploymentType) {

		switch (deploymentType) {
		case java:
			return Optional.of(new JvmDeployer());
		case java_xmi:
			return Optional.of(new JvmXmiDeployer());
		case docker:
			return Optional.of(new DockerDeployer());
		case k8:
			return Optional.of(new KubernetesDeployer());
		case none:
			return Optional.of(new NoneDeployer(WEBSOCKET_URL,STORAGE_URL));
		default:
			return Optional.empty();
		}
	}

	protected List<String> getServices() {
		return List.of(
				"completion"
//				, 
//				"definition"
//				, 
//				"highlight"
//				, 
//				"documentsymbol"
//				,
//				"formatting"
//				, 
//				"hover", 
//				"references"
//				,
//				"rename"
//				, 
//				"symbol"
				);
	}

	public List<String> getDocuments(String inputFolder) {
		try {
			return Files.list(Paths.get(inputFolder)).map(it -> it.toString()).collect(Collectors.toList());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return new LinkedList<>();
	}
	
	protected ProcessBuilder getNetworkMonitoringBuilder(Deployer deployer, String outputFile) {
		Collection<String> allUrls = deployer.getServiceUrls().values();
		Set<String> allPorts = allUrls.stream().map(url -> getPort(url)).filter(opt -> opt.isPresent()).map(opt -> "tcp port " + opt.get()).collect(Collectors.toSet());
		String portFilter = String.join(" or ", allPorts);
		
		System.out.println("[DEBUG] Filter: " + portFilter);
		System.out.println("[DEBUG] Dump file: " + outputFile);
		
		List<String> args = new LinkedList<>();
		args.add("tshark");
		args.add("-i");
		args.add("any");
		args.add("-f");
		args.add(portFilter);
//		args.add("host 127.0.0.1");
//		args.add(hostFilter);
		args.add("-w");
		args.add(outputFile);
		String[] argArray = new String[args.size()];
		args.toArray(argArray);
		return new ProcessBuilder(argArray);
	}
	
	protected Optional<String> getHost(String urlString) {
		try {
			urlString = urlString.replace("ws://"," http://"); // URL don't like websocket
			URL url = new URL(urlString);
			return Optional.of(url.getHost());
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
		return Optional.empty();
	}
	
	protected Optional<Integer> getPort(String urlString) {
		try {
			urlString = urlString.replace("ws://"," http://"); // URL don't like websocket
			URL url = new URL(urlString);
			return Optional.of(url.getPort());
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
		return Optional.empty();
	}
	
	protected String documentSimpleName(String document) {
		int slashPos = document.lastIndexOf("/");
		if(slashPos != -1) {
			return document.substring(slashPos+1);
		}
		return document;
	}

}
