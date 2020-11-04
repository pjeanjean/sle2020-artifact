package fr.inria.diverse.deployment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import fr.inria.diverse.benchmark.LANGUAGE;

public class NoneDeployer implements Deployer {
	
	protected Map<String,String> serviceUrls = new HashMap<>();
	
	public NoneDeployer(String websocket) {
		serviceUrls.put("router", websocket);
		serviceUrls.put("monolith", websocket);
	}
	
	public NoneDeployer(String websocket, String storage) {
		serviceUrls.put("storage", storage);
		serviceUrls.put("router", websocket);
		serviceUrls.put("monolith", websocket);
	}

	@Override
	public void deploy(LANGUAGE lang, List<String> services) {
		// do nothing
	}

	@Override
	public Map<String, String> getServiceUrls() {
		return serviceUrls;
	}

	@Override
	public void destroyAll() {
		// do nothing
	}

}
