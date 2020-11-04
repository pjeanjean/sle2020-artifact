package fr.inria.diverse.deployment;

import java.util.List;
import java.util.Map;

import fr.inria.diverse.benchmark.LANGUAGE;

public interface Deployer {

	void deploy(LANGUAGE lang, List<String> services);
	
	Map<String,String> getServiceUrls();
	
	void destroyAll();
	
}
