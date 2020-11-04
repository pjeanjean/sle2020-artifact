package fr.inria.diverse.metrics;

import fr.inria.diverse.request.Request;

public class Record {

	public Request request;
	public Long start;
	public Long end;
	public String reply = "";
	public String trace = "";

	public Record(Request request,Long start, Long end) {
		this.request = request;
		this.start = start;
		this.end = end;
	}
}
