package fr.inria.diverse.network;

import java.math.BigDecimal;

import com.google.gson.JsonObject;

public class Interval {
	
	public String name;
	public String uri;
	public JsonObject request;
	public JsonObject reply;
	public BigDecimal start;
	public BigDecimal end;
	public BigDecimal duration;
	public BigDecimal effectiveDuration;

}
