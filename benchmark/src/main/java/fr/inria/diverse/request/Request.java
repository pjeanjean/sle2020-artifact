package fr.inria.diverse.request;

import org.json.JSONObject;

public class Request {

	public int id;
	public String fileUri;
	public String service;
	public JSONObject message;
	
	public Request (int id, String fileUri, String service, JSONObject message) {
		this.id = id;
		this.fileUri = fileUri;
		this.service = service;
		this.message = message;
	}
	
}
