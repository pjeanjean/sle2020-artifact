package fr.inria.diverse.deployment;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Optional;

import fr.inria.diverse.benchmark.LANGUAGE;

public class JvmDeployer implements Deployer {
	
	
	public static final String NABLA_MONOLITH_JAR = "/home/fcoulon/git/distributed-xtext-server-for-lsp/monolithicServers/nabla-lsp-server/target/nabla-lsp-server-1.0-SNAPSHOT-runner.jar";
	public static final String LOGO_MONOLITH_JAR = "/home/fcoulon/git/distributed-xtext-server-for-lsp/monolithicServers/logo-lsp-server/target/logo-lsp-server-1.0-SNAPSHOT-runner.jar";
	public static final String THINGML_MONOLITH_JAR = "/home/fcoulon/git/distributed-xtext-server-for-lsp/monolithicServers/thingml-lsp-server/target/thingml-lsp-server-1.0-SNAPSHOT-runner.jar";
	public static final String MINIJAVA_MONOLITH_JAR = "/home/fcoulon/git/distributed-xtext-server-for-lsp/monolithicServers/minijava-lsp-server/target/minijava-lsp-server-1.0-SNAPSHOT-runner.jar";
	

	public static final String ROUTER_JAR = "/home/fcoulon/git/distributed-xtext-server-for-lsp/backend/lsp/lsp-router/target/lsp-router-1.0-SNAPSHOT-runner.jar";
	public static final String STORAGE_JAR = "/home/fcoulon/git/distributed-xtext-server-for-lsp/backend/document-storage/target/document-storage-1.0-SNAPSHOT-runner.jar";
	
	public static final String NABLA_COMPLETION_JAR = "/home/fcoulon/git/distributed-xtext-server-for-lsp/nablab/completion/target/completion-1.0-SNAPSHOT-runner.jar";
	public static final String NABLA_DEFINITION_JAR = "/home/fcoulon/git/distributed-xtext-server-for-lsp/nablab/definition/target/definition-1.0-SNAPSHOT-runner.jar";
	public static final String NABLA_HIGHLIGHT_JAR = "/home/fcoulon/git/distributed-xtext-server-for-lsp/nablab/highlight/target/highlight-1.0-SNAPSHOT-runner.jar";
	public static final String NABLA_DOCUMENTSYMBOL_JAR = "/home/fcoulon/git/distributed-xtext-server-for-lsp/nablab/documentSymbol/target/documentSymbol-1.0-SNAPSHOT-runner.jar";
	public static final String NABLA_FORMATTING_JAR = "/home/fcoulon/git/distributed-xtext-server-for-lsp/nablab/formatting/target/formatting-1.0-SNAPSHOT-runner.jar";
	public static final String NABLA_HOVER_JAR = "/home/fcoulon/git/distributed-xtext-server-for-lsp/nablab/hover/target/hover-1.0-SNAPSHOT-runner.jar";
	public static final String NABLA_REFERENCES_JAR = "/home/fcoulon/git/distributed-xtext-server-for-lsp/nablab/references/target/references-1.0-SNAPSHOT-runner.jar";
	public static final String NABLA_RENAME_JAR = "/home/fcoulon/git/distributed-xtext-server-for-lsp/nablab/rename/target/rename-1.0-SNAPSHOT-runner.jar";
	public static final String NABLA_SYMBOL_JAR = "/home/fcoulon/git/distributed-xtext-server-for-lsp/nablab/symbol/target/symbol-1.0-SNAPSHOT-runner.jar";
	public static final String NABLA_WORKSPACE_JAR = "/home/fcoulon/git/distributed-xtext-server-for-lsp/nablab/workspace/target/workspace-1.0-SNAPSHOT-runner.jar";
	
	public static final String LOGO_COMPLETION_JAR = "/home/fcoulon/git/distributed-xtext-server-for-lsp/logo/completion/target/completion-1.0-SNAPSHOT-runner.jar";
	public static final String LOGO_DEFINITION_JAR = "/home/fcoulon/git/distributed-xtext-server-for-lsp/logo/definition/target/definition-1.0-SNAPSHOT-runner.jar";
	public static final String LOGO_HIGHLIGHT_JAR = "/home/fcoulon/git/distributed-xtext-server-for-lsp/logo/highlight/target/highlight-1.0-SNAPSHOT-runner.jar";
	public static final String LOGO_DOCUMENTSYMBOL_JAR = "/home/fcoulon/git/distributed-xtext-server-for-lsp/logo/documentSymbol/target/documentSymbol-1.0-SNAPSHOT-runner.jar";
	public static final String LOGO_FORMATTING_JAR = "/home/fcoulon/git/distributed-xtext-server-for-lsp/logo/formatting/target/formatting-1.0-SNAPSHOT-runner.jar";
	public static final String LOGO_HOVER_JAR = "/home/fcoulon/git/distributed-xtext-server-for-lsp/logo/hover/target/hover-1.0-SNAPSHOT-runner.jar";
	public static final String LOGO_REFERENCES_JAR = "/home/fcoulon/git/distributed-xtext-server-for-lsp/logo/references/target/references-1.0-SNAPSHOT-runner.jar";
	public static final String LOGO_RENAME_JAR = "/home/fcoulon/git/distributed-xtext-server-for-lsp/logo/rename/target/rename-1.0-SNAPSHOT-runner.jar";
	public static final String LOGO_SYMBOL_JAR = "/home/fcoulon/git/distributed-xtext-server-for-lsp/logo/symbol/target/symbol-1.0-SNAPSHOT-runner.jar";
	public static final String LOGO_WORKSPACE_JAR = "/home/fcoulon/git/distributed-xtext-server-for-lsp/logo/workspace/target/workspace-1.0-SNAPSHOT-runner.jar";
	
	public static final String THINGML_COMPLETION_JAR = "/home/fcoulon/git/distributed-xtext-server-for-lsp/thingml/completion/target/completion-1.0-SNAPSHOT-runner.jar";
	public static final String THINGML_DEFINITION_JAR = "/home/fcoulon/git/distributed-xtext-server-for-lsp/thingml/definition/target/definition-1.0-SNAPSHOT-runner.jar";
	public static final String THINGML_HIGHLIGHT_JAR = "/home/fcoulon/git/distributed-xtext-server-for-lsp/thingml/highlight/target/highlight-1.0-SNAPSHOT-runner.jar";
	public static final String THINGML_DOCUMENTSYMBOL_JAR = "/home/fcoulon/git/distributed-xtext-server-for-lsp/thingml/documentSymbol/target/documentSymbol-1.0-SNAPSHOT-runner.jar";
	public static final String THINGML_FORMATTING_JAR = "/home/fcoulon/git/distributed-xtext-server-for-lsp/thingml/formatting/target/formatting-1.0-SNAPSHOT-runner.jar";
	public static final String THINGML_HOVER_JAR = "/home/fcoulon/git/distributed-xtext-server-for-lsp/thingml/hover/target/hover-1.0-SNAPSHOT-runner.jar";
	public static final String THINGML_REFERENCES_JAR = "/home/fcoulon/git/distributed-xtext-server-for-lsp/thingml/references/target/references-1.0-SNAPSHOT-runner.jar";
	public static final String THINGML_RENAME_JAR = "/home/fcoulon/git/distributed-xtext-server-for-lsp/thingml/rename/target/rename-1.0-SNAPSHOT-runner.jar";
	public static final String THINGML_SYMBOL_JAR = "/home/fcoulon/git/distributed-xtext-server-for-lsp/thingml/symbol/target/symbol-1.0-SNAPSHOT-runner.jar";
	public static final String THINGML_WORKSPACE_JAR = "/home/fcoulon/git/distributed-xtext-server-for-lsp/thingml/workspace/target/workspace-1.0-SNAPSHOT-runner.jar";

	public static final String MINIJAVA_COMPLETION_JAR = "/home/fcoulon/git/distributed-xtext-server-for-lsp/minijava/completion/target/completion-1.0-SNAPSHOT-runner.jar";
	public static final String MINIJAVA_DEFINITION_JAR = "/home/fcoulon/git/distributed-xtext-server-for-lsp/minijava/definition/target/definition-1.0-SNAPSHOT-runner.jar";
	public static final String MINIJAVA_HIGHLIGHT_JAR = "/home/fcoulon/git/distributed-xtext-server-for-lsp/minijava/highlight/target/highlight-1.0-SNAPSHOT-runner.jar";
	public static final String MINIJAVA_DOCUMENTSYMBOL_JAR = "/home/fcoulon/git/distributed-xtext-server-for-lsp/minijava/documentSymbol/target/documentSymbol-1.0-SNAPSHOT-runner.jar";
	public static final String MINIJAVA_FORMATTING_JAR = "/home/fcoulon/git/distributed-xtext-server-for-lsp/minijava/formatting/target/formatting-1.0-SNAPSHOT-runner.jar";
	public static final String MINIJAVA_HOVER_JAR = "/home/fcoulon/git/distributed-xtext-server-for-lsp/minijava/hover/target/hover-1.0-SNAPSHOT-runner.jar";
	public static final String MINIJAVA_REFERENCES_JAR = "/home/fcoulon/git/distributed-xtext-server-for-lsp/minijava/references/target/references-1.0-SNAPSHOT-runner.jar";
	public static final String MINIJAVA_RENAME_JAR = "/home/fcoulon/git/distributed-xtext-server-for-lsp/minijava/rename/target/rename-1.0-SNAPSHOT-runner.jar";
	public static final String MINIJAVA_SYMBOL_JAR = "/home/fcoulon/git/distributed-xtext-server-for-lsp/minijava/symbol/target/symbol-1.0-SNAPSHOT-runner.jar";
	public static final String MINIJAVA_WORKSPACE_JAR = "/home/fcoulon/git/distributed-xtext-server-for-lsp/minijava/workspace/target/workspace-1.0-SNAPSHOT-runner.jar";

	
	public static final String IS_READY_PATTERN = "Listening on:";
	
	public static final String JAEGER_ENDPOINT = "-Dquarkus.jaeger.endpoint=http://localhost:14268/api/traces";

	protected Map<String,Process> runningProcesses = new HashMap<>();
	protected Map<String,Integer> servicePort = new HashMap<>();
	
	protected int currentAvailablePort = 8080;

	public static void main(String[] args) {

		JvmDeployer deployer = new JvmDeployer();
		deployer.deploy(LANGUAGE.Nabla,List.of("router","completion"));
		deployer.destroyAll();
		
		System.out.println("DONE");
	}

	public void deploy(LANGUAGE lang, List<String> services) {
		
		if(services.size() == 1 && services.contains("monolith")) {
			final int monolithPort = currentAvailablePort;
			currentAvailablePort++;
			Optional<Process> monolithProc = deployMonolith(lang, monolithPort);
			if(monolithProc.isPresent()) {
				runningProcesses.put("monolith",monolithProc.get());
				servicePort.put("monolith", monolithPort);
			}
		}
		else {
			final int storagePort = currentAvailablePort;
			currentAvailablePort++;
			Optional<Process> storageProc = deployStorage(storagePort);
			if(storageProc.isPresent()) {
				runningProcesses.put("storage",storageProc.get());
				servicePort.put("storage", storagePort);
			}
			
			final int workspacePort = currentAvailablePort;
			currentAvailablePort++;
			Optional<Process> workspaceProc = deployWorkspace(lang, workspacePort, services.size()-1); // -1 to not count the router
			if(workspaceProc.isPresent()) {
				runningProcesses.put("workspace",workspaceProc.get());
				servicePort.put("workspace", workspacePort);
			}
			
			for (String service : services) {
				if(!service.equals("router") && !service.equals("storage") && !service.equals("workspace")) {
					final int allocatedPort = currentAvailablePort;
					currentAvailablePort++;
					Optional<Process> proc = deploy(lang, service,allocatedPort);
					if(proc.isPresent()) {
						runningProcesses.put(service,proc.get());
						servicePort.put(service, allocatedPort);
					}
				}
			}
			
			final int routerPort = currentAvailablePort;
			currentAvailablePort++;
			Optional<Process> routerProc = deployRouter(routerPort);
			if(routerProc.isPresent()) {
				runningProcesses.put("router",routerProc.get());
				servicePort.put("router", routerPort);
			}
		}
	}
	
	public void destroyAll() {
		for(Process proc : runningProcesses.values()) {
//			System.out.println("Destroy");
			proc.destroy();
		}
		runningProcesses.clear();
		servicePort.clear();
	}

	protected Optional<Process> deploy(LANGUAGE lang, String service, int port) {
		
		String storageUrl = getServiceUrls().get("storage");
		String workspaceUrl = getServiceUrls().get("workspace");
		
		if(lang == LANGUAGE.Nabla) {
			switch (service) {
			case "completion":
				return launchJVM(NABLA_COMPLETION_JAR, List.of("-Dquarkus.http.port="+port, "-Dnablab.storageResource/mp-rest/url="+storageUrl, JAEGER_ENDPOINT) );
			case "definition":
				return launchJVM(NABLA_DEFINITION_JAR, List.of("-Dquarkus.http.port="+port, "-Dnablab.storageResource/mp-rest/url="+storageUrl, JAEGER_ENDPOINT) );
			case "highlight":
				return launchJVM(NABLA_HIGHLIGHT_JAR, List.of("-Dquarkus.http.port="+port, "-Dnablab.storageResource/mp-rest/url="+storageUrl, JAEGER_ENDPOINT) );
			case "documentsymbol":
				return launchJVM(NABLA_DOCUMENTSYMBOL_JAR, List.of("-Dquarkus.http.port="+port, "-Dnablab.storageResource/mp-rest/url="+storageUrl, JAEGER_ENDPOINT) );
			case "formatting":
				return launchJVM(NABLA_FORMATTING_JAR, List.of("-Dquarkus.http.port="+port, "-Dnablab.storageResource/mp-rest/url="+storageUrl, JAEGER_ENDPOINT) );
			case "hover":
				return launchJVM(NABLA_HOVER_JAR, List.of("-Dquarkus.http.port="+port, "-Dnablab.storageResource/mp-rest/url="+storageUrl, JAEGER_ENDPOINT) );
			case "references":
				return launchJVM(NABLA_REFERENCES_JAR, List.of("-Dquarkus.http.port="+port, "-Dnablab.storageResource/mp-rest/url="+storageUrl, "-Dnablab.workspaceResource/mp-rest/url="+workspaceUrl, JAEGER_ENDPOINT) );
			case "rename":
				return launchJVM(NABLA_RENAME_JAR, List.of("-Dquarkus.http.port="+port, "-Dnablab.storageResource/mp-rest/url="+storageUrl, JAEGER_ENDPOINT) );
			case "symbol":
				return launchJVM(NABLA_SYMBOL_JAR, List.of("-Dquarkus.http.port="+port, "-Dnablab.storageResource/mp-rest/url="+storageUrl, "-Dnablab.workspaceResource/mp-rest/url="+workspaceUrl, JAEGER_ENDPOINT) );
			default:
				return Optional.empty();
			}
		}
		else if(lang == LANGUAGE.Logo) {
			switch (service) {
			case "completion":
				return launchJVM(LOGO_COMPLETION_JAR, List.of("-Dquarkus.http.port="+port, "-Dlogo.storageResource/mp-rest/url="+storageUrl, JAEGER_ENDPOINT) );
			case "definition":
				return launchJVM(LOGO_DEFINITION_JAR, List.of("-Dquarkus.http.port="+port, "-Dlogo.storageResource/mp-rest/url="+storageUrl, JAEGER_ENDPOINT) );
			case "highlight":
				return launchJVM(LOGO_HIGHLIGHT_JAR, List.of("-Dquarkus.http.port="+port, "-Dlogo.storageResource/mp-rest/url="+storageUrl, JAEGER_ENDPOINT) );
			case "documentsymbol":
				return launchJVM(LOGO_DOCUMENTSYMBOL_JAR, List.of("-Dquarkus.http.port="+port, "-Dlogo.storageResource/mp-rest/url="+storageUrl, JAEGER_ENDPOINT) );
			case "formatting":
				return launchJVM(LOGO_FORMATTING_JAR, List.of("-Dquarkus.http.port="+port, "-Dlogo.storageResource/mp-rest/url="+storageUrl, JAEGER_ENDPOINT) );
			case "hover":
				return launchJVM(LOGO_HOVER_JAR, List.of("-Dquarkus.http.port="+port, "-Dlogo.storageResource/mp-rest/url="+storageUrl, JAEGER_ENDPOINT) );
			case "references":
				return launchJVM(LOGO_REFERENCES_JAR, List.of("-Dquarkus.http.port="+port, "-Dlogo.storageResource/mp-rest/url="+storageUrl, "-Dlogo.workspaceResource/mp-rest/url="+workspaceUrl, JAEGER_ENDPOINT) );
			case "rename":
				return launchJVM(LOGO_RENAME_JAR, List.of("-Dquarkus.http.port="+port, "-Dlogo.storageResource/mp-rest/url="+storageUrl, JAEGER_ENDPOINT) );
			case "symbol":
				return launchJVM(LOGO_SYMBOL_JAR, List.of("-Dquarkus.http.port="+port, "-Dlogo.storageResource/mp-rest/url="+storageUrl, "-Dlogo.workspaceResource/mp-rest/url="+workspaceUrl, JAEGER_ENDPOINT) );
			default:
				return Optional.empty();
			}
		}
		else if(lang == LANGUAGE.Thingml) {
			switch (service) {
			case "completion":
				return launchJVM(THINGML_COMPLETION_JAR, List.of("-Dquarkus.http.port="+port, "-Dthingml.storageResource/mp-rest/url="+storageUrl, JAEGER_ENDPOINT) );
			case "definition":
				return launchJVM(THINGML_DEFINITION_JAR, List.of("-Dquarkus.http.port="+port, "-Dthingml.storageResource/mp-rest/url="+storageUrl, JAEGER_ENDPOINT) );
			case "highlight":
				return launchJVM(THINGML_HIGHLIGHT_JAR, List.of("-Dquarkus.http.port="+port, "-Dthingml.storageResource/mp-rest/url="+storageUrl, JAEGER_ENDPOINT) );
			case "documentsymbol":
				return launchJVM(THINGML_DOCUMENTSYMBOL_JAR, List.of("-Dquarkus.http.port="+port, "-Dthingml.storageResource/mp-rest/url="+storageUrl, JAEGER_ENDPOINT) );
			case "formatting":
				return launchJVM(THINGML_FORMATTING_JAR, List.of("-Dquarkus.http.port="+port, "-Dthingml.storageResource/mp-rest/url="+storageUrl, JAEGER_ENDPOINT) );
			case "hover":
				return launchJVM(THINGML_HOVER_JAR, List.of("-Dquarkus.http.port="+port, "-Dthingml.storageResource/mp-rest/url="+storageUrl, JAEGER_ENDPOINT) );
			case "references":
				return launchJVM(THINGML_REFERENCES_JAR, List.of("-Dquarkus.http.port="+port, "-Dthingml.storageResource/mp-rest/url="+storageUrl, "-Dthingml.workspaceResource/mp-rest/url="+workspaceUrl, JAEGER_ENDPOINT) );
			case "rename":
				return launchJVM(THINGML_RENAME_JAR, List.of("-Dquarkus.http.port="+port, "-Dthingml.storageResource/mp-rest/url="+storageUrl, JAEGER_ENDPOINT) );
			case "symbol":
				return launchJVM(THINGML_SYMBOL_JAR, List.of("-Dquarkus.http.port="+port, "-Dthingml.storageResource/mp-rest/url="+storageUrl, "-Dthingml.workspaceResource/mp-rest/url="+workspaceUrl, JAEGER_ENDPOINT) );
			default:
				return Optional.empty();
			}
		}
		else if(lang == LANGUAGE.Minijava) {
			switch (service) {
			case "completion":
				return launchJVM(MINIJAVA_COMPLETION_JAR, List.of("-Dquarkus.http.port="+port, "-Dminijava.storageResource/mp-rest/url="+storageUrl, JAEGER_ENDPOINT) );
			case "definition":
				return launchJVM(MINIJAVA_DEFINITION_JAR, List.of("-Dquarkus.http.port="+port, "-Dminijava.storageResource/mp-rest/url="+storageUrl, JAEGER_ENDPOINT) );
			case "highlight":
				return launchJVM(MINIJAVA_HIGHLIGHT_JAR, List.of("-Dquarkus.http.port="+port, "-Dminijava.storageResource/mp-rest/url="+storageUrl, JAEGER_ENDPOINT) );
			case "documentsymbol":
				return launchJVM(MINIJAVA_DOCUMENTSYMBOL_JAR, List.of("-Dquarkus.http.port="+port, "-Dminijava.storageResource/mp-rest/url="+storageUrl, JAEGER_ENDPOINT) );
			case "formatting":
				return launchJVM(MINIJAVA_FORMATTING_JAR, List.of("-Dquarkus.http.port="+port, "-Dminijava.storageResource/mp-rest/url="+storageUrl, JAEGER_ENDPOINT) );
			case "hover":
				return launchJVM(MINIJAVA_HOVER_JAR, List.of("-Dquarkus.http.port="+port, "-Dminijava.storageResource/mp-rest/url="+storageUrl, JAEGER_ENDPOINT) );
			case "references":
				return launchJVM(MINIJAVA_REFERENCES_JAR, List.of("-Dquarkus.http.port="+port, "-Dminijava.storageResource/mp-rest/url="+storageUrl, "-Dminijava.workspaceResource/mp-rest/url="+workspaceUrl, JAEGER_ENDPOINT) );
			case "rename":
				return launchJVM(MINIJAVA_RENAME_JAR, List.of("-Dquarkus.http.port="+port, "-Dminijava.storageResource/mp-rest/url="+storageUrl, JAEGER_ENDPOINT) );
			case "symbol":
				return launchJVM(MINIJAVA_SYMBOL_JAR, List.of("-Dquarkus.http.port="+port, "-Dminijava.storageResource/mp-rest/url="+storageUrl, "-Dminijava.workspaceResource/mp-rest/url="+workspaceUrl, JAEGER_ENDPOINT) );
			default:
				return Optional.empty();
			}
		}
		
		return Optional.empty();
	}
	
	private Optional<Process> deployMonolith(LANGUAGE lang, int port) {
		
		if(lang == LANGUAGE.Nabla) {
			return launchJVM(NABLA_MONOLITH_JAR, List.of("-Dquarkus.http.port="+port) );
		}
		else if(lang == LANGUAGE.Logo) {
			return launchJVM(LOGO_MONOLITH_JAR, List.of("-Dquarkus.http.port="+port) );
		}
		else if(lang == LANGUAGE.Thingml) {
			return launchJVM(THINGML_MONOLITH_JAR, List.of("-Dquarkus.http.port="+port) );
		}
		else if(lang == LANGUAGE.Minijava) {
			return launchJVM(MINIJAVA_MONOLITH_JAR, List.of("-Dquarkus.http.port="+port) );
		}
		
		return Optional.empty();
	}
	
	private Optional<Process> deployStorage(int port) {
		return launchJVM(STORAGE_JAR, List.of("-Dquarkus.http.port="+port,"-Dquarkus.mongodb.connection-string=mongodb://localhost:27017",JAEGER_ENDPOINT));
	}
	
	protected Optional<Process> deployWorkspace(LANGUAGE lang, int port, int numberOfServices) {
		String storageUrl = getServiceUrls().get("storage");
		
		if(lang == LANGUAGE.Nabla) {
			return launchJVM(NABLA_WORKSPACE_JAR, List.of("-Dquarkus.http.port="+port, "-Dnablab.storageResource/mp-rest/url="+storageUrl, "-Dnablab.routerResource/mp-rest/url=http://localhost:"+(8080+numberOfServices), JAEGER_ENDPOINT ) ); // assume Router is the last deployed
		}
		else if(lang == LANGUAGE.Logo) {
			return launchJVM(LOGO_WORKSPACE_JAR, List.of("-Dquarkus.http.port="+port, "-Dlogo.storageResource/mp-rest/url="+storageUrl, "-Dlogo.routerResource/mp-rest/url=http://localhost:"+(8080+numberOfServices), JAEGER_ENDPOINT ) ); // assume Router is the last deployed
		}
		else if(lang == LANGUAGE.Thingml) {
			return launchJVM(THINGML_WORKSPACE_JAR, List.of("-Dquarkus.http.port="+port, "-Dthingml.storageResource/mp-rest/url="+storageUrl, "-Dthingml.routerResource/mp-rest/url=http://localhost:"+(8080+numberOfServices), JAEGER_ENDPOINT ) ); // assume Router is the last deployed
		}
		else if(lang == LANGUAGE.Minijava) {
			return launchJVM(MINIJAVA_WORKSPACE_JAR, List.of("-Dquarkus.http.port="+port, "-Dminijava.storageResource/mp-rest/url="+storageUrl, "-Dminijava.routerResource/mp-rest/url=http://localhost:"+(8080+numberOfServices), JAEGER_ENDPOINT ) ); // assume Router is the last deployed
		}
		
		return Optional.empty();
	}
	
	private Optional<Process> deployRouter(int port) {
		
		List<String> args = new LinkedList<>();
		args.add("-Dquarkus.http.port="+port);
		args.add(JAEGER_ENDPOINT);
		for(Entry<String, String> entry : getServiceUrls().entrySet()) {
			String service = entry.getKey();
			String url = entry.getValue();
			if(service.equals("highlight")) {
				args.add("-Dfr.inria.diverse.lsp.resources.DocumentHighlight/mp-rest/url=" + url);
			}
			else if(service.equals("documentsymbol")) {
				args.add("-Dfr.inria.diverse.lsp.resources.DocumentSymbol/mp-rest/url=" + url);
			}
			else if(!service.equals("storage")) {
				String firstLetter = service.substring(0, 1).toUpperCase();
				String lastPart = service.substring(1);
				String className = firstLetter + lastPart;
				args.add("-Dfr.inria.diverse.lsp.resources."+className+"/mp-rest/url=" + url);
			}
			
		}
		
		
		
		return launchJVM(ROUTER_JAR, args);
	}

	private Optional<Process> launchJVM(String jarPath) {
		return launchJVM(jarPath, List.of());
	}
	
	protected Optional<Process> launchJVM(String jarPath, List<String> params) {
		
//		System.out.println("Launch "+ jarPath + " " + params);

		List<String> args = new LinkedList<>();
		args.add("java");
		args.addAll(params);
		args.add("-jar");
		args.add(jarPath);
		
//		System.out.println(args);
		String[] argArray = new String[args.size()];
		args.toArray(argArray);
		ProcessBuilder builder = new ProcessBuilder(argArray);
		try {
			Process proc = builder.start();
			InputStream inputStream = proc.getInputStream();
			try (BufferedReader in = new BufferedReader(new InputStreamReader(inputStream))) {
				String line;
				while ((line = in.readLine()) != null) {
//					System.out.println(line);

					if (isReady(line)) {
//						System.out.println("[IS READY] " + jarPath);
						return Optional.of(proc);
					}
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		return Optional.empty();
	}

	private boolean isReady(String line) {
		return line.contains(IS_READY_PATTERN);
	}
	
	public Map<String,String> getServiceUrls() {
		Map<String,String> res = new HashMap<>();
		for(Entry<String, Integer> entry : servicePort.entrySet()) {
			if(entry.getKey().equals("router")) {
				res.put(entry.getKey(), "ws://localhost:"+entry.getValue());
			}
			else if(entry.getKey().equals("monolith")) {
				res.put(entry.getKey(), "ws://localhost:"+entry.getValue());
			}
			else {
				res.put(entry.getKey(), "http://localhost:"+entry.getValue());
			}
		}
		return res;
	}
}
