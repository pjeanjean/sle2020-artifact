package fr.inria.diverse.metrics;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

public class RecordRegistry {
	
	Map<Integer, Record> registry = new HashMap<>();

	public Collection<Record> getRecords() {
		return registry.values();
	}
	
	public Optional<Record> getRecord(int id) {
		return Optional.ofNullable(registry.get(id));
	}
	
	public void addRecord(Record record) {
		registry.put(record.request.id, record);
	}
	
}
