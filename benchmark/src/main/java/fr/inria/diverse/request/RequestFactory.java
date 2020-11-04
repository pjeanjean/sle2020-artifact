package fr.inria.diverse.request;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;

import fr.inria.diverse.benchmark.LANGUAGE;

public class RequestFactory {
	
	/**
	 * Return DocumentURI -> [Service requests]
	 */
	public static Map<String,List<Request>> createAllRequests(LANGUAGE lang, List<String> documents, List<String> services, int numberOfTries) {
		Map<String,List<Request>> res = new HashMap<>();
		for (String documentName : documents) {
			List<Request> requests = new LinkedList<>();
			res.put("inmemory:/"+documentName,requests);
			for (String service : services) {
				for(var i = 0; i < numberOfTries; i++) {
					JSONObject message = MessageFactory.createMessage(lang, service, "inmemory:/"+documentName);
					int id = message.getInt("id");
					Request request = new Request(id,"inmemory:/"+documentName,service,message);
					requests.add(request);
				}
			}
		}
		return res;
	}
}
