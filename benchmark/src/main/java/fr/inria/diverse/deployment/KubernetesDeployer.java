package fr.inria.diverse.deployment;

import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import fr.inria.diverse.benchmark.LANGUAGE;
import io.kubernetes.client.ApiClient;
import io.kubernetes.client.ApiException;
import io.kubernetes.client.Configuration;
import io.kubernetes.client.apis.CoreV1Api;
import io.kubernetes.client.custom.IntOrString;
import io.kubernetes.client.models.V1ContainerPort;
import io.kubernetes.client.models.V1ContainerStatus;
import io.kubernetes.client.models.V1Pod;
import io.kubernetes.client.models.V1PodBuilder;
import io.kubernetes.client.models.V1PodList;
import io.kubernetes.client.models.V1Service;
import io.kubernetes.client.models.V1ServiceBuilder;
import io.kubernetes.client.models.V1ServicePort;
import io.kubernetes.client.util.Config;

public class KubernetesDeployer implements Deployer {

	static final String CLUSTER_CONFIG_FILE = "/home/fcoulon/.kube/kind-config-clusterOne";

	public static final String IS_READY_PATTERN = "Listening on:";
	public static final String IS_MONGO_READY_PATTERN = "waiting for connections on port";

	int currentAvailablePort = 8080;
	List<String> runningServices = new LinkedList<>();

	CoreV1Api api;

	public KubernetesDeployer() {
		try {
			ApiClient client = Config.fromConfig(CLUSTER_CONFIG_FILE);
//			client.setDebugging(true);
//			ApiClient client = Config.defaultClient();
			Configuration.setDefaultApiClient(client);
		} catch (IOException e) {
			e.printStackTrace();
		}
		api = new CoreV1Api();
	}

//	public static void main(String[] args) {
//		
//		try {
//			ApiClient client = Config.fromConfig(CLUSTER_CONFIG_FILE);
//			client.setDebugging(true);
////			ApiClient client = Config.defaultClient();
//			Configuration.setDefaultApiClient(client);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		
//		CoreV1Api api = new CoreV1Api();
//		
//		KubernetesDeployer deployer = new KubernetesDeployer();
//		deployer.deploy(api, List.of("router","completion"));
//		deployer.waitClusterIsReady(api);
//		deployer.destroyAll(api);
//		
//		System.out.println("DONE");
//	}

	public void deploy(LANGUAGE lang, List<String> services) {

//		final int mongoPort = currentAvailablePort;
//		currentAvailablePort++;
//		configureCluster(api, DockerDeployer.MONGO_IMG, "mongo-db", 27017, 27017);
//		runningServices.add("mongo-db");

		for (String service : services) {
//			final int allocatedPort = currentAvailablePort;
//			currentAvailablePort++;
//			deploy(api, service, allocatedPort);
			if (service.equals("storage")) {
				deploy(lang, api, service, 8086);
			} else {
				deploy(lang, api, service, 8080);
			}
			runningServices.add(service);
		}

		waitClusterIsReady(api);

	}

	public void destroyAll() {
		for (String service : runningServices) {
			System.out.println("[DEBUG] Delete " + service);
			try {
				api.deleteNamespacedPod(service, "default", null, null, null, null, null, null);
			} catch (Exception e) {
//				e.printStackTrace();
			}
			try {
				api.deleteNamespacedService(service, "default", null, null, null, null, null, null);
			} catch (Exception e) {
//				e.printStackTrace();
			}
		}

		waitClusterCleanup(30000);

		runningServices.clear();
	}

	private void waitClusterCleanup(long timeout) {

		long startTime = System.currentTimeMillis();

		boolean continueWaiting = true;
		while (continueWaiting) {
			continueWaiting = false;

			try {
				V1PodList list = api.listPodForAllNamespaces(null, null, null, null, null, null, null, null, null);
				for (V1Pod item : list.getItems()) {
					String podName = item.getMetadata().getName();
					if (runningServices.contains(podName)) {
						continueWaiting = true;
					}
				}
			} catch (ApiException e) {
				e.printStackTrace();
			}

			long currentTime = System.currentTimeMillis();
			if ((currentTime - startTime) >= timeout) {
				return;
			}

			System.out.println("[DEBUG] Wait cluster cleanup " + (currentTime - startTime) / 1000.0);

			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}

		}
	}

	private void deploy(LANGUAGE lang, CoreV1Api api, String service, int port) {
		
		if(lang == LANGUAGE.Nabla) {
			switch (service) {
			case "router":
				configureCluster(api, DockerDeployer.ROUTER_IMG, "router", port);
				return;
			case "storage":
				configureCluster(api, DockerDeployer.STORAGE_IMG, "storage", port);
				return;
			case "completion":
				configureCluster(api, DockerDeployer.NABLA_COMPLETION_IMG, "completion", port);
				return;
			case "definition":
				configureCluster(api, DockerDeployer.NABLA_DEFINITION_IMG, "definition", port);
				return;
			case "highlight":
				configureCluster(api, DockerDeployer.NABLA_HIGHLIGHT_IMG, "highlight", port);
				return;
			case "documentsymbol":
				configureCluster(api, DockerDeployer.NABLA_DOCUMENTSYMBOL_IMG, "documentsymbol", port);
				return;
			case "formatting":
				configureCluster(api, DockerDeployer.NABLA_FORMATTING_IMG, "formatting", port);
				return;
			case "hover":
				configureCluster(api, DockerDeployer.NABLA_HOVER_IMG, "hover", port);
				return;
			case "references":
				configureCluster(api, DockerDeployer.NABLA_REFERENCES_IMG, "references", port);
				return;
			case "rename":
				configureCluster(api, DockerDeployer.NABLA_RENAME_IMG, "rename", port);
				return;
			case "symbol":
				configureCluster(api, DockerDeployer.NABLA_SYMBOL_IMG, "symbol", port);
				return;
			case "workspace":
				configureCluster(api, DockerDeployer.NABLA_WORKSPACE_IMG, "workspace", port);
				return;
			default:
				return;
			}
		}
		else if(lang == LANGUAGE.Logo) {
			switch (service) {
			case "router":
				configureCluster(api, DockerDeployer.ROUTER_IMG, "router", port);
				return;
			case "storage":
				configureCluster(api, DockerDeployer.STORAGE_IMG, "storage", port);
				return;
			case "completion":
				configureCluster(api, DockerDeployer.LOGO_COMPLETION_IMG, "completion", port);
				return;
			case "definition":
				configureCluster(api, DockerDeployer.LOGO_DEFINITION_IMG, "definition", port);
				return;
			case "highlight":
				configureCluster(api, DockerDeployer.LOGO_HIGHLIGHT_IMG, "highlight", port);
				return;
			case "documentsymbol":
				configureCluster(api, DockerDeployer.LOGO_DOCUMENTSYMBOL_IMG, "documentsymbol", port);
				return;
			case "formatting":
				configureCluster(api, DockerDeployer.LOGO_FORMATTING_IMG, "formatting", port);
				return;
			case "hover":
				configureCluster(api, DockerDeployer.LOGO_HOVER_IMG, "hover", port);
				return;
			case "references":
				configureCluster(api, DockerDeployer.LOGO_REFERENCES_IMG, "references", port);
				return;
			case "rename":
				configureCluster(api, DockerDeployer.LOGO_RENAME_IMG, "rename", port);
				return;
			case "symbol":
				configureCluster(api, DockerDeployer.LOGO_SYMBOL_IMG, "symbol", port);
				return;
			case "workspace":
				configureCluster(api, DockerDeployer.LOGO_WORKSPACE_IMG, "workspace", port);
				return;
			default:
				return;
			}
		}
		else if(lang == LANGUAGE.Thingml) {
			switch (service) {
			case "router":
				configureCluster(api, DockerDeployer.ROUTER_IMG, "router", port);
				return;
			case "storage":
				configureCluster(api, DockerDeployer.STORAGE_IMG, "storage", port);
				return;
			case "completion":
				configureCluster(api, DockerDeployer.THINGML_COMPLETION_IMG, "completion", port);
				return;
			case "definition":
				configureCluster(api, DockerDeployer.THINGML_DEFINITION_IMG, "definition", port);
				return;
			case "highlight":
				configureCluster(api, DockerDeployer.THINGML_HIGHLIGHT_IMG, "highlight", port);
				return;
			case "documentsymbol":
				configureCluster(api, DockerDeployer.THINGML_DOCUMENTSYMBOL_IMG, "documentsymbol", port);
				return;
			case "formatting":
				configureCluster(api, DockerDeployer.THINGML_FORMATTING_IMG, "formatting", port);
				return;
			case "hover":
				configureCluster(api, DockerDeployer.THINGML_HOVER_IMG, "hover", port);
				return;
			case "references":
				configureCluster(api, DockerDeployer.THINGML_REFERENCES_IMG, "references", port);
				return;
			case "rename":
				configureCluster(api, DockerDeployer.THINGML_RENAME_IMG, "rename", port);
				return;
			case "symbol":
				configureCluster(api, DockerDeployer.THINGML_SYMBOL_IMG, "symbol", port);
				return;
			case "workspace":
				configureCluster(api, DockerDeployer.THINGML_WORKSPACE_IMG, "workspace", port);
				return;
			default:
				return;
			}
		}	
	}

	private void configureCluster(CoreV1Api api, String image, String serviceName, int port) {
		configureCluster(api, image, serviceName, 8080, port);
	}

	private void configureCluster(CoreV1Api api, String image, String serviceName, int innerPort, int externalPort) {

		System.out.println("[DEBUG] Launch " + serviceName + " (" + image + ") on " + externalPort + ":" + innerPort);

		V1Pod pod = createPod(serviceName, image, Optional.of(innerPort));
		V1Service service = createService(serviceName, serviceName, Optional.of(innerPort), Optional.of(externalPort),
				Optional.of("TCP"));

		try {
			api.createNamespacedPod("default", pod, null, null, null);
			api.createNamespacedService("default", service, null, null, null);
		} catch (ApiException e) {
			e.printStackTrace();
		}

	}

	public Map<String, String> getServiceUrls() {

		Map<String, String> res = new HashMap<>();

		for (String service : runningServices) {
			try {
				V1Pod pod = api.readNamespacedPod(service, "default", null, null, null);
				V1Service srv = api.readNamespacedService(service, "default", null, null, null);
				String url = "http://" + pod.getStatus().getHostIP() + ":"
						+ srv.getSpec().getPorts().get(0).getNodePort();
				if (service.equals("router")) {
					url = "ws://" + pod.getStatus().getHostIP() + ":" + srv.getSpec().getPorts().get(0).getNodePort();
				}
				res.put(service, url);
			} catch (ApiException e) {
				e.printStackTrace();
			}
		}

		return res;
	}

	public static V1Pod createPod(String podName, String dockerImage, Optional<Integer> port) {

		List<V1ContainerPort> containerPorts = new LinkedList<>();
		if (port.isPresent()) {
			V1ContainerPort containerPort = new V1ContainerPort();
			containerPort.setContainerPort(port.get());
		}

		V1Pod pod = new V1PodBuilder().withNewMetadata().withName(podName.toLowerCase())
				.addToLabels("app", podName.toLowerCase()).endMetadata().withNewSpec().addNewContainer()
				.withName(podName.toLowerCase()).withImage(dockerImage).withPorts(containerPorts)
				.withImagePullPolicy("IfNotPresent").endContainer().endSpec().build();
		return pod;
	}

	public static V1Service createService(String serviceName, String podSelector, Optional<Integer> innerPort,
			Optional<Integer> externalPort, Optional<String> protocol) {

		List<V1ServicePort> servicePorts = new LinkedList<>();
		if (innerPort.isPresent() && externalPort.isPresent()) {
			V1ServicePort port = new V1ServicePort();
			port.setTargetPort(new IntOrString(innerPort.get()));
			port.setPort(externalPort.get());
			if (protocol.isPresent()) {
				port.setProtocol(protocol.get());
			}
			servicePorts.add(port);
		}

		Map<String, String> serviceSelectors = new HashMap<>();
		serviceSelectors.put("app", podSelector.toLowerCase());

		V1Service srv = new V1ServiceBuilder().withNewMetadata().withName(serviceName.toLowerCase()).endMetadata()
				.withNewSpec().withPorts(servicePorts).withSelector(serviceSelectors).withType("NodePort").endSpec()
				.build();

//			System.out.println(Yaml.dump(srv));

		return srv;
	}

	private void waitClusterIsReady(CoreV1Api api) {
		System.out.println("[DEBUG] Wait cluster is ready");
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		for (String service : runningServices) {
			waitPodIsDeployed(api, service, 30000);
			waitPodIsReady(api, service, 30000);
		}
	}

//	private boolean isReady(String line) {
//		return line.contains(IS_READY_PATTERN);
//	}
	
	private void waitPodIsDeployed(CoreV1Api api, String waitedPod, long timeout) {
		
		long startTime = System.currentTimeMillis();
		
		while (true) {
			long currentTime = System.currentTimeMillis();
			try {
				V1PodList list = api.listPodForAllNamespaces(null, null, null, null, null, null, null, null, null);
				for (V1Pod item : list.getItems()) {
					String podName = item.getMetadata().getName();
					if (podName.equals(waitedPod)  || (currentTime - startTime) >= timeout) {
						waitPodContainersAreStarted(item,timeout);
						return;
					}
				}
			} catch (ApiException e) {
				e.printStackTrace();
			}
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}
	
	private void waitPodContainersAreStarted(V1Pod pod, long timeout) {
		
		long startTime = System.currentTimeMillis();
		while(true) {
			long currentTime = System.currentTimeMillis();
			
			boolean containersReady = true;
			for(V1ContainerStatus status : pod.getStatus().getContainerStatuses()) {
				containersReady = containersReady && status.isReady();
			}
			
			if(containersReady || (currentTime - startTime) >= timeout) {
				return;
			}
		}
	}

	private void waitPodIsReady(CoreV1Api api, String podName, long timeout) {

		long startTime = System.currentTimeMillis();

		while (true) {
			long currentTime = System.currentTimeMillis();
			try {
				String log = api.readNamespacedPodLog(podName, "default", null, null, null, null, null, null, null,
						null);
				if (podName.equals("mongo-db")) {
					if (log.contains(IS_MONGO_READY_PATTERN) || (currentTime - startTime) >= timeout) {
						return;
					}
				} else {
					if (log.contains(IS_READY_PATTERN) || (currentTime - startTime) >= timeout) {
						return;
					}
				}
			} catch (ApiException e) {
				System.out.println(e.getResponseBody());
				System.out.println("[DEBUG] Fail to log pod: " + podName);
				e.printStackTrace();
			}
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}
}
