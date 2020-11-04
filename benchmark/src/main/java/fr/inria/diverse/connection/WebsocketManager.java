package fr.inria.diverse.connection;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.LinkedList;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.TimeUnit;

import javax.websocket.ClientEndpointConfig;
import javax.websocket.DeploymentException;
import javax.websocket.Endpoint;
import javax.websocket.EndpointConfig;
import javax.websocket.Session;

import org.glassfish.tyrus.client.ClientManager;
import org.json.JSONObject;
import javax.websocket.MessageHandler.Whole;

import fr.inria.diverse.metrics.Record;
import fr.inria.diverse.metrics.RecordRegistry;
import fr.inria.diverse.request.Request;
import fr.inria.diverse.trace.TraceHelper;
import fr.inria.diverse.request.MessageFactory;

public class WebsocketManager {

	Optional<Session> websocket;
	LinkedList<Request> toProcess = new LinkedList<>();
	RecordRegistry recordRegistry = new RecordRegistry();
	
	Request waitingFor;

	public WebsocketManager(String url, boolean isTraced) {
		this.websocket = openWaitingSocket(url, isTraced);
	}
	
	protected Optional<Session> openWaitingSocket(String url, boolean isTraced) {
		ClientEndpointConfig cec = ClientEndpointConfig.Builder.create().build();
		ClientManager client = ClientManager.createClient();
		try {
			Session session = client.connectToServer(new Endpoint() {
				
				public void onOpen(Session session, EndpointConfig config) {
					
					session.addMessageHandler(new Whole<String>() {
						public void onMessage(String message) {
							try {
								long end = System.currentTimeMillis();
								JSONObject json = new JSONObject(message);
								
								if(json.has("id")) {
									int id = json.getInt("id");
									
									Optional<Record> record = recordRegistry.getRecord(id);
									if(record.isPresent()) {
										record.get().end = end;
										record.get().reply = message;
										
										if(isTraced) {
											TimeUnit.MILLISECONDS.sleep(2000);
											Optional<String> trace = TraceHelper.getTrace(record.get().request.service);
											if(trace.isPresent()) {
												record.get().trace = trace.get();
											}
										}
										
										System.out.println("[DEBUG] Recieve: " + id);
										synchronized(session) {
									        session.notify();
									    }
									}
									else {
										System.out.println("[DEBUG] Recieve unknown: " + id);
									}
								}
								else if(json.has("method") && json.getString("method").equals("textDocument/publishDiagnostics")) {
//									System.out.println("[DEBUG] Recieve diagnostics : " + message);
									System.out.println("[DEBUG] Recieve diagnostics");
									synchronized(session) {
								        session.notify();
								    }
								}
							}
							catch(Exception e) {
								System.out.println("[DEBUG] Failed to parse received message: \"" + message + "\"");
								e.printStackTrace();
								session.notify();
							}
						}
					});
				}
			}, cec, new URI(url));
			return Optional.ofNullable(session);
		} catch (DeploymentException | IOException | URISyntaxException e) {
			e.printStackTrace();
		}
		return Optional.empty();
	}

	public void append(List<Request> requests) {
		toProcess.addAll(requests);
	}
	
	public void sendRequests(long timeout) {
		if(websocket.isPresent()) {
			while(hasRequest()) {
				sendNext();
				synchronized(websocket.get()) {
					try {
						websocket.get().wait(timeout); //notify called in MessageHandler ( see openWaitingSocket() )
					} catch (InterruptedException e) {
						e.printStackTrace();
					} 
				}
			}
		}
	}

	protected void sendNext() {

		waitingFor = toProcess.pop();
		System.out.println("[Bench] "+waitingFor.service+" on "+waitingFor.fileUri);
		
		Record record = new Record(waitingFor, 0L, 0L);
		this.recordRegistry.addRecord(record);
		
		System.out.println("[DEBUG] Send: " + waitingFor.id);
		record.start = System.currentTimeMillis();
		sendMessage(waitingFor.message.toString());
	}
	
	/**
	 * Send a message that will not be recorded, should use append(List<Request>) otherwise 
	 */
	public void sendMessage(String message) {
		if(websocket.isPresent()) {
			try {
				websocket.get().getBasicRemote().sendText(message);
//				System.out.println("[DEBUG] "+message);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		else {
			System.out.println("[Error] Tried to send a message but websocket wasn't opened");
		}
	}

	protected boolean hasRequest() {
		return !toProcess.isEmpty();
	}
	
	public void close() {
		if(this.websocket.isPresent()) {
			try {
				this.websocket.get().close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	public RecordRegistry getRecordRegistry() {
		return recordRegistry;
	}
	
	public void cleanRecordRegistry() {
		recordRegistry = new RecordRegistry();
	}
	
	public void init(long waitTimeAfterInit) {
		try {
			String initRequest = MessageFactory.createInitRequest().toString();
			sendMessage(initRequest);
			TimeUnit.MILLISECONDS.sleep(waitTimeAfterInit);
			String initialized = MessageFactory.createInitializedNotification().toString();
			sendMessage(initialized);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
	
	public void openDocument(String fileName, long waitTimeAfterOpen) {
		
		String prefix = "inmemory:/";
		String realFileName = fileName.replace(prefix, "");
		
		int dotPos = fileName.lastIndexOf(".");
		String extension = fileName.substring(dotPos+1);
		
		try {
			byte[] bytes = Files.readAllBytes(Paths.get(realFileName));
			String content = new String(bytes, StandardCharsets.UTF_8);
			String openNotif = MessageFactory.createDidOpenNotification(fileName,content,extension).toString();
			sendMessage(openNotif);
			synchronized(websocket.get()) {
				websocket.get().wait(); //notify called in MessageHandler ( see openWaitingSocket() )
			}
//			TimeUnit.MILLISECONDS.sleep(waitTimeAfterOpen);
		} catch (IOException | InterruptedException e) {
			e.printStackTrace();
		}
	}
	
	public void closeDocument(String fileName) {
		String closeNotif = MessageFactory.createDidCloseNotification(fileName).toString();
		sendMessage(closeNotif);
	}

}
