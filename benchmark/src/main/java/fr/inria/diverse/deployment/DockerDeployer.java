package fr.inria.diverse.deployment;

import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Map.Entry;

import com.github.dockerjava.api.DockerClient;
import com.github.dockerjava.api.command.CreateContainerResponse;
import com.github.dockerjava.api.command.InspectVolumeResponse;
import com.github.dockerjava.api.model.Container;
import com.github.dockerjava.api.model.ContainerMount;
import com.github.dockerjava.api.model.ExposedPort;
import com.github.dockerjava.api.model.Frame;
import com.github.dockerjava.api.model.HostConfig;
import com.github.dockerjava.api.model.Network;
import com.github.dockerjava.api.model.PortBinding;
import com.github.dockerjava.api.model.Ports;
import com.github.dockerjava.api.model.VolumeBind;
import com.github.dockerjava.api.model.VolumeRW;
import com.github.dockerjava.core.DockerClientBuilder;
import com.github.dockerjava.core.command.LogContainerResultCallback;

import fr.inria.diverse.benchmark.LANGUAGE;

public class DockerDeployer implements Deployer {
	
	public static final String NABLA_MONOLITH_IMG = "nabla/monolith";
	public static final String LOGO_MONOLITH_IMG = "logo/monolith";
	public static final String THINGML_MONOLITH_IMG = "thingml/monolith";
	
	public static final String ROUTER_IMG = "kaulua/router";
	public static final String STORAGE_IMG = "kaulua/storage";
	public static final String MONGO_IMG = "mongo:4.0";
	
	public static final String NABLA_COMPLETION_IMG = "nabla/completion";
	public static final String NABLA_DEFINITION_IMG = "nabla/definition";
	public static final String NABLA_HIGHLIGHT_IMG = "nabla/highlight";
	public static final String NABLA_DOCUMENTSYMBOL_IMG = "nabla/documentsymbol";
	public static final String NABLA_FORMATTING_IMG = "nabla/formatting";
	public static final String NABLA_HOVER_IMG = "nabla/hover";
	public static final String NABLA_REFERENCES_IMG = "nabla/references";
	public static final String NABLA_RENAME_IMG = "nabla/rename";
	public static final String NABLA_SYMBOL_IMG = "nabla/symbol";
	public static final String NABLA_WORKSPACE_IMG = "nabla/workspace";
	
	public static final String LOGO_COMPLETION_IMG = "logo/completion";
	public static final String LOGO_DEFINITION_IMG = "logo/definition";
	public static final String LOGO_HIGHLIGHT_IMG = "logo/highlight";
	public static final String LOGO_DOCUMENTSYMBOL_IMG = "logo/documentsymbol";
	public static final String LOGO_FORMATTING_IMG = "logo/formatting";
	public static final String LOGO_HOVER_IMG = "logo/hover";
	public static final String LOGO_REFERENCES_IMG = "logo/references";
	public static final String LOGO_RENAME_IMG = "logo/rename";
	public static final String LOGO_SYMBOL_IMG = "logo/symbol";
	public static final String LOGO_WORKSPACE_IMG = "logo/workspace";
	
	public static final String THINGML_COMPLETION_IMG = "thingml/completion";
	public static final String THINGML_DEFINITION_IMG = "thingml/definition";
	public static final String THINGML_HIGHLIGHT_IMG = "thingml/highlight";
	public static final String THINGML_DOCUMENTSYMBOL_IMG = "thingml/documentsymbol";
	public static final String THINGML_FORMATTING_IMG = "thingml/formatting";
	public static final String THINGML_HOVER_IMG = "thingml/hover";
	public static final String THINGML_REFERENCES_IMG = "thingml/references";
	public static final String THINGML_RENAME_IMG = "thingml/rename";
	public static final String THINGML_SYMBOL_IMG = "thingml/symbol";
	public static final String THINGML_WORKSPACE_IMG = "thingml/workspace";
	
	
	public static final String IS_READY_PATTERN = "Listening on:";
	public static final String IS_MONGO_READY_PATTERN = "waiting for connections on port";
	
	public static final String BENCH_NETWORK= "benchmark";
	
	Map<String,String> runningContainers = new HashMap<>();
	Map<String,Integer> servicePort = new HashMap<>();
	
	int currentAvailablePort = 8080;
	
	DockerClient dockerClient;
	
//	public static void main(String[] args) {
//		DockerClient dockerClient = DockerClientBuilder.getInstance().build();
//		
//		DockerDeployer deployer = new DockerDeployer();
//		deployer.deploy(dockerClient, List.of("router","completion"));
//		deployer.destroyAll(dockerClient);
//		
//		System.out.println("DONE");
//	}
	
	public DockerDeployer() {
		dockerClient = DockerClientBuilder.getInstance().build();
	}
	
	public void deploy(LANGUAGE lang, List<String> services) {
		Optional<Network> network = getBenchmarkNetwork();

		List<String> servicesAndMongo = new LinkedList<>();
		servicesAndMongo.addAll(services);
		servicesAndMongo.add("mongo-db");
		
		List<Container> toRemove = dockerClient.listContainersCmd().withShowAll(true).withNameFilter(servicesAndMongo).exec();
		for(Container container : toRemove) {
			System.out.println("Remove container");
			if(container.getState().equals("running")) {
				dockerClient.killContainerCmd(container.getId()).exec();
			}
			
//			List<InspectVolumeResponse> volumes = dockerClient.listVolumesCmd().exec().getVolumes();
//			for(InspectVolumeResponse volume : volumes) {
//				volume.getName();
//			}
//			
//			for(ContainerMount mount : container.getMounts()) {
////				System.out.println("[DEBUG] Container "+ container.getNames()[0] +" " + mount.getName());
//				try {
//					System.out.println("Remove volume " + mount.getName() + "("+container.getNames()[0]+")");
//					dockerClient.removeVolumeCmd(mount.getName()).exec();
//				}
//				catch(Exception e) {
//					
//				}
//			}
			
			dockerClient.removeContainerCmd(container.getId()).exec();
		}
		
		ProcessBuilder builder = new ProcessBuilder("docker", "volume", "prune", "--force");
		try {
			Process proc = builder.start();
			proc.waitFor();
		} catch (IOException | InterruptedException e) {
			e.printStackTrace();
		}
		
		
		
		if(services.size() == 1 && services.contains("monolith")) {
			int allocatedPort = currentAvailablePort;
			currentAvailablePort++;
			Optional<String> id = deploy(lang, dockerClient, "monolith",allocatedPort, network);
			if(id.isPresent()) {
				runningContainers.put("monolith",id.get());
				servicePort.put("monolith", allocatedPort);
			}
		}
		else {
			final int mongoPort = currentAvailablePort;
			currentAvailablePort++;
			String mongoId = launchContainer(dockerClient, MONGO_IMG, "mongo-db", mongoPort, 27017, network);
			runningContainers.put("mongo-db",mongoId);
			
			for (String service : services) {
				
				int allocatedPort = currentAvailablePort;
				currentAvailablePort++;
				Optional<String> id = deploy(lang, dockerClient, service,allocatedPort, network);
				if(id.isPresent()) {
					runningContainers.put(service,id.get());
					servicePort.put(service, allocatedPort);
				}
			}
		}
	}
	
	private Optional<Network> getBenchmarkNetwork() {
		List<Network> networks = dockerClient.listNetworksCmd().exec();
		for(Network network : networks) {
			if(network.getName().equals(BENCH_NETWORK)) {
				return Optional.of(network);
			}
		}
		return Optional.empty();
	}

	public void destroyAll() {
		for(String id : runningContainers.values()) {
			System.out.println("Destroy");
			try {
				dockerClient.killContainerCmd(id).exec();
			}
			catch(Exception e ) {
				e.printStackTrace();
			}
		}
		runningContainers.clear();
		servicePort.clear();
	}
	
	private Optional<String> deploy(LANGUAGE lang, DockerClient client,String service, int port, Optional<Network> network) {
		
		if(lang == LANGUAGE.Nabla) {
			switch (service) {
			case "router":
				return Optional.of(launchContainer(client, ROUTER_IMG, "router", port, network));
			case "storage":
				return Optional.of(launchContainer(client, STORAGE_IMG, "storage", port, network));
			case "completion":
				return Optional.of(launchContainer(client, NABLA_COMPLETION_IMG, "completion", port, network));
			case "definition":
				return Optional.of(launchContainer(client, NABLA_DEFINITION_IMG, "definition", port, network));
			case "highlight":
				return Optional.of(launchContainer(client, NABLA_HIGHLIGHT_IMG, "highlight", port, network));
			case "documentsymbol":
				return Optional.of(launchContainer(client, NABLA_DOCUMENTSYMBOL_IMG, "documentsymbol", port, network));
			case "formatting":
				return Optional.of(launchContainer(client, NABLA_FORMATTING_IMG, "formatting", port, network));
			case "hover":
				return Optional.of(launchContainer(client, NABLA_HOVER_IMG, "hover", port, network));
			case "references":
				return Optional.of(launchContainer(client, NABLA_REFERENCES_IMG, "references", port, network));
			case "rename":
				return Optional.of(launchContainer(client, NABLA_RENAME_IMG, "rename", port, network));
			case "symbol":
				return Optional.of(launchContainer(client, NABLA_SYMBOL_IMG, "symbol", port, network));
			case "workspace":
				return Optional.of(launchContainer(client, NABLA_WORKSPACE_IMG, "workspace", port, network));
			case "monolith":
				return Optional.of(launchContainer(client, NABLA_MONOLITH_IMG, "monolith", port, network));
			default:
				return Optional.empty();
			}
		}
		else if(lang == LANGUAGE.Logo) {
			switch (service) {
			case "router":
				return Optional.of(launchContainer(client, ROUTER_IMG, "router", port, network));
			case "storage":
				return Optional.of(launchContainer(client, STORAGE_IMG, "storage", port, network));
			case "completion":
				return Optional.of(launchContainer(client, LOGO_COMPLETION_IMG, "completion", port, network));
			case "definition":
				return Optional.of(launchContainer(client, LOGO_DEFINITION_IMG, "definition", port, network));
			case "highlight":
				return Optional.of(launchContainer(client, LOGO_HIGHLIGHT_IMG, "highlight", port, network));
			case "documentsymbol":
				return Optional.of(launchContainer(client, LOGO_DOCUMENTSYMBOL_IMG, "documentsymbol", port, network));
			case "formatting":
				return Optional.of(launchContainer(client, LOGO_FORMATTING_IMG, "formatting", port, network));
			case "hover":
				return Optional.of(launchContainer(client, LOGO_HOVER_IMG, "hover", port, network));
			case "references":
				return Optional.of(launchContainer(client, LOGO_REFERENCES_IMG, "references", port, network));
			case "rename":
				return Optional.of(launchContainer(client, LOGO_RENAME_IMG, "rename", port, network));
			case "symbol":
				return Optional.of(launchContainer(client, LOGO_SYMBOL_IMG, "symbol", port, network));
			case "workspace":
				return Optional.of(launchContainer(client, LOGO_WORKSPACE_IMG, "workspace", port, network));
			case "monolith":
				return Optional.of(launchContainer(client, LOGO_MONOLITH_IMG, "monolith", port, network));
			default:
				return Optional.empty();
			}
		}
		else if(lang == LANGUAGE.Thingml) {
			switch (service) {
			case "router":
				return Optional.of(launchContainer(client, ROUTER_IMG, "router", port, network));
			case "storage":
				return Optional.of(launchContainer(client, STORAGE_IMG, "storage", port, network));
			case "completion":
				return Optional.of(launchContainer(client, THINGML_COMPLETION_IMG, "completion", port, network));
			case "definition":
				return Optional.of(launchContainer(client, THINGML_DEFINITION_IMG, "definition", port, network));
			case "highlight":
				return Optional.of(launchContainer(client, THINGML_HIGHLIGHT_IMG, "highlight", port, network));
			case "documentsymbol":
				return Optional.of(launchContainer(client, THINGML_DOCUMENTSYMBOL_IMG, "documentsymbol", port, network));
			case "formatting":
				return Optional.of(launchContainer(client, THINGML_FORMATTING_IMG, "formatting", port, network));
			case "hover":
				return Optional.of(launchContainer(client, THINGML_HOVER_IMG, "hover", port, network));
			case "references":
				return Optional.of(launchContainer(client, THINGML_REFERENCES_IMG, "references", port, network));
			case "rename":
				return Optional.of(launchContainer(client, THINGML_RENAME_IMG, "rename", port, network));
			case "symbol":
				return Optional.of(launchContainer(client, THINGML_SYMBOL_IMG, "symbol", port, network));
			case "workspace":
				return Optional.of(launchContainer(client, THINGML_WORKSPACE_IMG, "workspace", port, network));
			case "monolith":
				return Optional.of(launchContainer(client, THINGML_MONOLITH_IMG, "monolith", port, network));
			default:
				return Optional.empty();
			}
		}
		
		return Optional.empty();

	}
	
	private String launchContainer(DockerClient client, String image, String service, int port, Optional<Network> network) {
		if(service.equals("storage")) {
			return launchContainer(client,image,service,port,8086, network); //FIXME: hard coded port
		}
		else {
			return launchContainer(client,image,service,port,8080, network);
		}
	}
	
	private String launchContainer(DockerClient client, String image, String service, int hostPort, int containerPort, Optional<Network> network) {
		
		System.out.println("[DEBUG] Launch " + image + " with port binding "+hostPort+":"+containerPort);
		
		ExposedPort tcpPort = ExposedPort.tcp(containerPort);
		Ports portBindings = new Ports();
		portBindings.bind(tcpPort, Ports.Binding.bindPort(hostPort));
		
		CreateContainerResponse container
		  = client.createContainerCmd(image)
		    .withName(service)
		    .withExposedPorts(tcpPort)
		    .withHostConfig(new HostConfig().withPortBindings(portBindings))
//		    .withHostConfig(new HostConfig().withPortBindings(PortBinding.parse(hostPort+":"+containerPort)))
		    .withEnv("JAVA_OPTIONS=-Dquarkus.http.port="+containerPort+" -Dquarkus.http.host=0.0.0.0 -Djava.util.logging.manager=org.jboss.logmanager.LogManager")
		    .exec();
		
		if(network.isPresent()) {
			String containerId = container.getId();
			dockerClient.connectToNetworkCmd().withContainerId(containerId).withNetworkId(network.get().getId()).exec();
		}
		
		client.startContainerCmd(container.getId()).exec();
		
		try {
			client.logContainerCmd(container.getId()).withStdOut(true).withStdErr(true).withFollowStream(true).exec(new LogContainerResultCallback() {
				@Override
				public void onNext(Frame item) {
					System.out.println(item.toString());
					
					if(image.equals(MONGO_IMG) && isMongoReady(item.toString())) {
						this.onComplete();
					}
					else if(isReady(item.toString())) {
						this.onComplete();
					}
				}
			}).awaitCompletion();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		return container.getId();
	}
	
	private boolean isReady(String line) {
		return line.contains(IS_READY_PATTERN);
	}
	
	private boolean isMongoReady(String line) {
		return line.contains(IS_MONGO_READY_PATTERN);
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
