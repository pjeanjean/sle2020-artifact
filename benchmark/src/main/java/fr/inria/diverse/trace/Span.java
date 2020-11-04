package fr.inria.diverse.trace;

import java.util.ArrayList;
import java.util.List;

public class Span {
	public String id;
	public Long duration;
	public String processId;
	public String operationName;
	List<Span> children;
	
	public Span(String id, Long duration, String process, String operationName) {
		this.id = id;
		this.duration = duration;
		this.processId = process;
		this.operationName = operationName;
		children = new ArrayList<>();
	}
	
	public List<Span> getChildren() {
		return children;
	}
}
