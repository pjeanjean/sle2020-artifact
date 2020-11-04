package fr.inria.diverse.request;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import fr.inria.diverse.benchmark.LANGUAGE;

public class MessageFactory {
	
	static int counter = 2;
	
	public static synchronized void resetCounter() {
		counter = 0;
	}
	
	public static synchronized int getCounter() {
		return counter;
	}
	
	public static synchronized int getCounterAndIncrement() {
		return counter++;
	}
	
	public static JSONObject createMessage(LANGUAGE lang, String service, String fileUri) {
		
		if(lang == LANGUAGE.Nabla) {
			switch (service) {
				case "didChange": {
					return createDidChangeNotification(); // TODO
				}
				case "completion": {
					return createCompletionRequest(fileUri, 5, 16);
				}
				case "definition": {
					return createDefinitionRequest(fileUri, 45+((toSize(fileUri)-1)*18), 9); // add an offset depending of the size of the file
				}
				case "highlight": {
					return createHighlightRequest(fileUri, 5, 3);
				}
				case "documentsymbol": {
					return createDocumentSymbolRequest(fileUri);
				}
				case "formatting": {
					return createFormattingRequest(fileUri);
				}
				case "hover": {
					return createHoverRequest(fileUri, 5, 3);
				}
				case "references": {
					return createReferenceRequest(fileUri, 5, 3);
				}
				case "rename": {
					return createRenameRequest(fileUri, 5, 3, "foobar");
				}
				case "symbol": {
					return createSymbolRequest("nodes");
				}
				default: {
					return new JSONObject();
				}
			}
		}
		else if(lang == LANGUAGE.Logo) {
			switch (service) {
				case "didChange": {
					return createDidChangeNotification(); // TODO
				}
				case "completion": {
					return createCompletionRequest(fileUri, 19, 3);
				}
				case "definition": {
					return createDefinitionRequest(fileUri, 19, 3);
				}
				case "highlight": {
					return createHighlightRequest(fileUri, 19, 3);
				}
				case "documentsymbol": {
					return createDocumentSymbolRequest(fileUri);
				}
				case "formatting": {
					return createFormattingRequest(fileUri);
				}
				case "hover": {
					return createHoverRequest(fileUri, 19, 3);
				}
				case "references": {
					return createReferenceRequest(fileUri, 19, 3);
				}
				case "rename": {
					return createRenameRequest(fileUri, 1, 9, "foobar");
				}
				case "symbol": {
					return createSymbolRequest("Tree");
				}
				default: {
					return new JSONObject();
				}
			}
		}
		else if(lang == LANGUAGE.Thingml) {
			switch (service) {
			case "didChange": {
				return createDidChangeNotification(); // TODO
			}
			case "completion": {
				return createCompletionRequest(fileUri, 6, 30);
			}
			case "definition": {
				return createDefinitionRequest(fileUri, 6, 30);
			}
			case "highlight": {
				return createHighlightRequest(fileUri, 1, 19);
			}
			case "documentsymbol": {
				return createDocumentSymbolRequest(fileUri);
			}
			case "formatting": {
				return createFormattingRequest(fileUri);
			}
			case "hover": {
				return createHoverRequest(fileUri, 1, 18);
			}
			case "references": {
				return createReferenceRequest(fileUri, 1, 19);
			}
			case "rename": {
				return createRenameRequest(fileUri, 1, 19, "foobar");
			}
			case "symbol": {
				return createSymbolRequest("PingClient");
			}
			default: {
				return new JSONObject();
			}
		}
		}
		else if(lang == LANGUAGE.Minijava) {
			switch (service) {
			case "didChange": {
				return createDidChangeNotification(); // TODO
			}
			case "completion": {
				return createCompletionRequest(fileUri, 7+(toSize(fileUri)-1), 11);
			}
			case "definition": {
				return createDefinitionRequest(fileUri, 7+(toSize(fileUri)-1), 1);
			}
			case "highlight": {
				return createHighlightRequest(fileUri, 4, 8);
			}
			case "documentsymbol": {
				return createDocumentSymbolRequest(fileUri);
			}
			case "formatting": {
				return createFormattingRequest(fileUri);
			}
			case "hover": {
				return createHoverRequest(fileUri, 4, 8);
			}
			case "references": {
				return createReferenceRequest(fileUri, 4, 8);
			}
			case "rename": {
				return createRenameRequest(fileUri, 4, 8, "foobar");
			}
			case "symbol": {
				return createSymbolRequest("counter");
			}
			default: {
				return new JSONObject();
			}
		}
		}
		
		
		return new JSONObject();
	}
	
	public static String createInitRequest() {
		return "{\"jsonrpc\":\"2.0\",\"id\":"+getCounterAndIncrement()+",\"method\":\"initialize\",\"params\":{\"rootPath\":null,\"rootUri\":null,\"capabilities\":{\"workspace\":{\"applyEdit\":true,\"workspaceEdit\":{\"documentChanges\":true},\"didChangeConfiguration\":{\"dynamicRegistration\":true},\"didChangeWatchedFiles\":{\"dynamicRegistration\":true},\"symbol\":{\"dynamicRegistration\":true,\"symbolKind\":{\"valueSet\":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26]}},\"executeCommand\":{\"dynamicRegistration\":true},\"workspaceFolders\":true},\"textDocument\":{\"publishDiagnostics\":{\"relatedInformation\":true},\"synchronization\":{\"dynamicRegistration\":true,\"willSave\":true,\"willSaveWaitUntil\":true,\"didSave\":true},\"completion\":{\"dynamicRegistration\":true,\"contextSupport\":true,\"completionItem\":{\"snippetSupport\":true,\"commitCharactersSupport\":true,\"documentationFormat\":[\"markdown\",\"plaintext\"],\"deprecatedSupport\":true,\"preselectSupport\":true},\"completionItemKind\":{\"valueSet\":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25]}},\"hover\":{\"dynamicRegistration\":true,\"contentFormat\":[\"markdown\",\"plaintext\"]},\"signatureHelp\":{\"dynamicRegistration\":true,\"signatureInformation\":{\"documentationFormat\":[\"markdown\",\"plaintext\"]}},\"definition\":{\"dynamicRegistration\":true},\"references\":{\"dynamicRegistration\":true},\"documentHighlight\":{\"dynamicRegistration\":true},\"documentSymbol\":{\"dynamicRegistration\":true,\"symbolKind\":{\"valueSet\":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26]},\"hierarchicalDocumentSymbolSupport\":true},\"codeAction\":{\"dynamicRegistration\":true,\"codeActionLiteralSupport\":{\"codeActionKind\":{\"valueSet\":[\"\",\"quickfix\",\"refactor\",\"refactor.extract\",\"refactor.inline\",\"refactor.rewrite\",\"source\",\"source.organizeImports\"]}}},\"codeLens\":{\"dynamicRegistration\":true},\"formatting\":{\"dynamicRegistration\":true},\"rangeFormatting\":{\"dynamicRegistration\":true},\"onTypeFormatting\":{\"dynamicRegistration\":true},\"rename\":{\"dynamicRegistration\":true},\"documentLink\":{\"dynamicRegistration\":true},\"typeDefinition\":{\"dynamicRegistration\":true},\"implementation\":{\"dynamicRegistration\":true},\"colorProvider\":{\"dynamicRegistration\":true},\"foldingRange\":{\"dynamicRegistration\":true,\"rangeLimit\":5000,\"lineFoldingOnly\":true}}},\"trace\":\"off\",\"workspaceFolders\":null}}";
	}
	
	public static JSONObject createInitializedNotification() {
		JSONObject jsonObject = new JSONObject();
		JSONObject param = new JSONObject();
		jsonObject.put("jsonrpc", "2.0");
		jsonObject.put("method", "initialized");
		jsonObject.put("params",param);
		return jsonObject;
	}
	
	public static JSONObject createDidChangeNotification() {
		return new JSONObject(); // TODO
	}
	
	public static JSONObject createCompletionRequest(String uri, int line, int column) {
		
//		println("[DEBUG] counter completion: "+counter)
		
		JSONObject jsonObject = new JSONObject();
		JSONObject param = new JSONObject();
		JSONObject textDoc = new JSONObject();
		JSONObject pos = new JSONObject();
		JSONObject context = new JSONObject();
		jsonObject.put("jsonrpc", "2.0");
		jsonObject.put("id", getCounterAndIncrement());
		jsonObject.put("method", "textDocument/completion");
		jsonObject.put("params",param);
		param.put("textDocument",textDoc);
		textDoc.put("uri",uri);
		param.put("position",pos);
		pos.put("line",line);
		pos.put("character",column);
		param.put("context",context);
		context.put("triggerKind",1);
		
		return jsonObject;
		
//		return  '''
//			{
//				"jsonrpc": "2.0",
//				"id": 1,
//				"method": "completion",
//				"params": {
//				  {
//				    "textDocument": {
//				      "uri": "«uri»"
//				    },
//				    "position": {
//				      "line": «line»,
//				      "character": «column»
//				    },
//				    "context": {
//				      "triggerKind": 1
//				    }
//				  }
//				}
//			}
//		'''
	}
	
	public static JSONObject createDefinitionRequest(String uri, int line, int column) {
		
		JSONObject jsonObject = new JSONObject();
		JSONObject param = new JSONObject();
		JSONObject textDoc = new JSONObject();
		JSONObject pos = new JSONObject();
		jsonObject.put("jsonrpc", "2.0");
		jsonObject.put("id", getCounterAndIncrement());
		jsonObject.put("method", "textDocument/definition");
		jsonObject.put("params",param);
		param.put("textDocument",textDoc);
		textDoc.put("uri",uri);
		param.put("position",pos);
		pos.put("line",line);
		pos.put("character",column);
		
		return jsonObject;
		
//		return  '''
//			{
//				"jsonrpc": "2.0",
//				"id": 1,
//				"method": "definition",
//				"params": {
//				  {
//				    "textDocument": {
//				      "uri": "«uri»"
//				    },
//				    "position": {
//				    	line: «line»,
//				    	character: «column»
//				  }
//				}
//			}
//		'''
	}
	
	public static JSONObject createHighlightRequest(String uri, int line, int column) {
		
		JSONObject jsonObject = new JSONObject();
		JSONObject param = new JSONObject();
		JSONObject textDoc = new JSONObject();
		JSONObject pos = new JSONObject();
		jsonObject.put("jsonrpc", "2.0");
		jsonObject.put("id", getCounterAndIncrement());
		jsonObject.put("method", "textDocument/documentHighlight");
		jsonObject.put("params",param);
		param.put("textDocument",textDoc);
		textDoc.put("uri",uri);
		param.put("position",pos);
		pos.put("line",line);
		pos.put("character",column);
		
		return jsonObject;
		
//		return '''
//			{
//				"jsonrpc": "2.0",
//				"id": 1,
//				"method": "documentHighlight",
//				"params": {
//				  {
//				    "textDocument": {
//				      "uri": "«uri»"
//				    },
//				    "position": {
//				      "line": «line»,
//				      "character": «column»
//				    }
//				  }
//				}
//			}
//		'''
	}
	
	public static JSONObject createDocumentSymbolRequest(String uri) {
		
		JSONObject jsonObject = new JSONObject();
		JSONObject param = new JSONObject();
		JSONObject textDoc = new JSONObject();
		jsonObject.put("jsonrpc", "2.0");
		jsonObject.put("id", getCounterAndIncrement());
		jsonObject.put("method", "textDocument/documentSymbol");
		jsonObject.put("params",param);
		param.put("textDocument",textDoc);
		textDoc.put("uri",uri);
		
		return jsonObject;
		
//		return '''
//			{
//				"jsonrpc": "2.0",
//				"id": 1,
//				"method": "documentSymbol",
//				"params": {
//				  "textDocument": {
//				    "uri": "«uri»"
//				  }
//				}
//			}
//		'''
	}
	
	public static JSONObject createFormattingRequest(String uri) {
		
		JSONObject jsonObject = new JSONObject();
		JSONObject param = new JSONObject();
		JSONObject textDoc = new JSONObject();
		jsonObject.put("jsonrpc", "2.0");
		jsonObject.put("id", getCounterAndIncrement());
		jsonObject.put("method", "textDocument/formatting");
		jsonObject.put("params",param);
		param.put("textDocument",textDoc);
		textDoc.put("uri",uri);
		
		return jsonObject;
		
//		return '''
//			{
//				"jsonrpc": "2.0",
//				"id": 1,
//				"method": "documentSymbol",
//				"params": {
//				  "textDocument": {
//				    "uri": "«uri»"
//				  }
//				}
//			}
//		'''
	}
	
	public static JSONObject createHoverRequest(String uri, int line, int column) {
		
		JSONObject jsonObject = new JSONObject();
		JSONObject param = new JSONObject();
		JSONObject textDoc = new JSONObject();
		JSONObject pos = new JSONObject();
		jsonObject.put("jsonrpc", "2.0");
		jsonObject.put("id", getCounterAndIncrement());
		jsonObject.put("method", "textDocument/hover");
		jsonObject.put("params",param);
		param.put("textDocument",textDoc);
		textDoc.put("uri",uri);
		param.put("position",pos);
		pos.put("line",line);
		pos.put("character",column);
		
		return jsonObject;
		
//		return '''
//			{
//				"jsonrpc": "2.0",
//				"id": 1,
//				"method": "hover",
//				"params": {
//				  {
//				    "textDocument": {
//				      "uri": "«uri»"
//				    },
//				    "position": {
//				      "line": «line»,
//				      "character": «column»
//				    }
//				  }
//				}
//			}
//		'''
	}
	
	public static JSONObject createReferenceRequest(String uri, int line, int column) {
		
		JSONObject jsonObject = new JSONObject();
		JSONObject param = new JSONObject();
		JSONObject textDoc = new JSONObject();
		JSONObject pos = new JSONObject();
		JSONObject context = new JSONObject();
		jsonObject.put("jsonrpc", "2.0");
		jsonObject.put("id", getCounterAndIncrement());
		jsonObject.put("method", "textDocument/references");
		jsonObject.put("params",param);
		param.put("textDocument",textDoc);
		textDoc.put("uri",uri);
		param.put("position",pos);
		pos.put("line",line);
		pos.put("character",column);
		param.put("context",context);
		context.put("includeDeclaration",true);
		
		return jsonObject;
		
//		return '''
//			{
//				"jsonrpc": "2.0",
//				"id": 1,
//				"method": "references",
//				"params": {
//				  {
//				    "textDocument": {
//				      "uri": "«uri»"
//				    },
//				    "position": {
//					  line: «line»,
//					  character: «column»
//					},
//				    "context": {
//				      "includeDeclaration": true
//				    }
//				  }
//				}
//			}
//		'''
	}
	
	public static JSONObject createRenameRequest(String uri, int line, int column, String value) {
		
		JSONObject jsonObject = new JSONObject();
		JSONObject param = new JSONObject();
		JSONObject textDoc = new JSONObject();
		JSONObject pos = new JSONObject();
		jsonObject.put("jsonrpc", "2.0");
		jsonObject.put("id", getCounterAndIncrement());
		jsonObject.put("method", "textDocument/rename");
		jsonObject.put("params",param);
		param.put("textDocument",textDoc);
		textDoc.put("uri",uri);
		param.put("position",pos);
		pos.put("line",line);
		pos.put("character",column);
		param.put("newName",value);
		
		return jsonObject;
		
//		return '''
//			{
//				"jsonrpc": "2.0",
//				"id": 1,
//				"method": "rename",
//				"params": {
//				  {
//				    "textDocument": {
//				      "uri": "«uri»"
//				    },
//				    "position": {
//					  line: «line»,
//					  character: «column»
//					},
//				    "newName": "«value»"
//				  }
//				}
//			}
//		'''
	}
	
	public static JSONObject createSymbolRequest(String query) {
		
		JSONObject jsonObject = new JSONObject();
		JSONObject param = new JSONObject();
		jsonObject.put("jsonrpc", "2.0");
		jsonObject.put("id", getCounterAndIncrement());
		jsonObject.put("method", "workspace/symbol");
		jsonObject.put("params",param);
		param.put("query",query);
		
		return jsonObject;
		
//		return '''
//			{
//				"jsonrpc": "2.0",
//				"id": 1,
//				"method": "symbol",
//				"params": {
//				  {
//				    "query": "«query»"
//				}
//			}
//		'''
	}
	
	public static JSONObject createDidOpenNotification(String file, String content, String language) {
			
		JSONObject jsonObject = new JSONObject();
		JSONObject param = new JSONObject();
		JSONObject textDoc = new JSONObject();
		jsonObject.put("jsonrpc", "2.0");
		jsonObject.put("method", "textDocument/didOpen");
		jsonObject.put("params",param);
		param.put("textDocument",textDoc);
		textDoc.put("uri",file);
		textDoc.put("languageId",language);
		textDoc.put("version",1);
		textDoc.put("text",content);
		
		return jsonObject;
	}
	
	public static JSONObject createDidCloseNotification(String file) {
			
		JSONObject jsonObject = new JSONObject();
		JSONObject param = new JSONObject();
		JSONObject textDoc = new JSONObject();
		jsonObject.put("jsonrpc", "2.0");
		jsonObject.put("method", "textDocument/didClose");
		jsonObject.put("params",param);
		param.put("textDocument",textDoc);
		textDoc.put("uri",file);
		return jsonObject;
	}
	
	public static int toSize(String fileName) {
		int separator = fileName.lastIndexOf("_");
		int ext = fileName.lastIndexOf(".");
		String sizeSuffix = fileName.substring(separator+1,ext);
		return Integer.parseInt(sizeSuffix);
	}
	
	public static JSONObject createDiagramRequest(List<String> params) {
		
		JSONObject jsonObject = new JSONObject();
		JSONArray paramsArray = new JSONArray(params);
		jsonObject.put("id", getCounterAndIncrement());
		jsonObject.put("params",paramsArray);
		
		return jsonObject;
		
//		return '''
//			{
//				"id": 1,
//				"params": []
//			}
//		'''
	}
	
	public static JSONObject createFormRequest(List<String> params) {
		
		JSONObject jsonObject = new JSONObject();
		JSONArray paramsArray = new JSONArray(params);
		jsonObject.put("id", getCounterAndIncrement());
		jsonObject.put("params",paramsArray);
		
		return jsonObject;
		
//		return '''
//			{
//				"id": 1,
//				"params": []
//			}
//		'''
	}
}