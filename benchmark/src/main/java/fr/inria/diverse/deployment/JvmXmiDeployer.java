package fr.inria.diverse.deployment;

import java.util.List;
import java.util.Optional;

import fr.inria.diverse.benchmark.LANGUAGE;

public class JvmXmiDeployer extends JvmDeployer {

//	public static final String COMPLETION_XMI_JAR = "/home/fcoulon/git/demonablab/backend/src-microservices-xmi/completion-xmi/target/completion-xmi-1.0-SNAPSHOT-runner.jar";
//	public static final String DEFINITION_XMI_JAR = "/home/fcoulon/git/demonablab/backend/src-microservices-xmi/definition-xmi/target/definition-xmi-1.0-SNAPSHOT-runner.jar";
//	public static final String HIGHLIGHT_XMI_JAR = "/home/fcoulon/git/demonablab/backend/src-microservices-xmi/highlight-xmi/target/highlight-xmi-1.0-SNAPSHOT-runner.jar";
//	public static final String DOCUMENTSYMBOL_XMI_JAR = "/home/fcoulon/git/demonablab/backend/src-microservices-xmi/documentSymbol-xmi/target/documentSymbol-xmi-1.0-SNAPSHOT-runner.jar";
//	public static final String FORMATTING_XMI_JAR = "/home/fcoulon/git/demonablab/backend/src-microservices-xmi/formatting-xmi/target/formatting-xmi-1.0-SNAPSHOT-runner.jar";
//	public static final String HOVER_XMI_JAR = "/home/fcoulon/git/demonablab/backend/src-microservices-xmi/hover-xmi/target/hover-xmi-1.0-SNAPSHOT-runner.jar";
//	public static final String REFERENCES_XMI_JAR = "/home/fcoulon/git/demonablab/backend/src-microservices-xmi/reference-xmi/target/reference-xmi-1.0-SNAPSHOT-runner.jar";
//	public static final String RENAME_XMI_JAR = "/home/fcoulon/git/demonablab/backend/src-microservices-xmi/rename-xmi/target/rename-xmi-1.0-SNAPSHOT-runner.jar";
//	public static final String SYMBOL_XMI_JAR = "/home/fcoulon/git/demonablab/backend/src-microservices-xmi/symbol-xmi/target/symbol-xmi-1.0-SNAPSHOT-runner.jar";
//	public static final String WORKSPACE_XMI_JAR = "/home/fcoulon/git/demonablab/backend/src-microservices-xmi/workspace-xmi/target/workspace-xmi-1.0-SNAPSHOT-runner.jar";
	
	@Override
	protected Optional<Process> deploy(LANGUAGE lang, String service, int port) {
		
//		String workspaceUrl = getServiceUrls().get("workspace");
//
//		switch (service) {
//		case "completion":
//			return launchJVM(COMPLETION_XMI_JAR, List.of("-Xss10m", "-Dquarkus.http.port="+port, "-DNabla.workspaceResource/mp-rest/url="+workspaceUrl, JAEGER_ENDPOINT) );
//		case "definition":
//			return launchJVM(DEFINITION_XMI_JAR, List.of("-Xss10m", "-Dquarkus.http.port="+port, "-DNabla.workspaceResource/mp-rest/url="+workspaceUrl, JAEGER_ENDPOINT) );
//		case "highlight":
//			return launchJVM(HIGHLIGHT_XMI_JAR, List.of("-Xss10m", "-Dquarkus.http.port="+port, "-DNabla.workspaceResource/mp-rest/url="+workspaceUrl, JAEGER_ENDPOINT) );
//		case "documentsymbol":
//			return launchJVM(DOCUMENTSYMBOL_XMI_JAR, List.of("-Xss10m", "-Dquarkus.http.port="+port, "-DNabla.workspaceResource/mp-rest/url="+workspaceUrl, JAEGER_ENDPOINT) );
//		case "formatting":
//			return launchJVM(FORMATTING_XMI_JAR, List.of("-Xss10m", "-Dquarkus.http.port="+port, "-DNabla.workspaceResource/mp-rest/url="+workspaceUrl, JAEGER_ENDPOINT) );
//		case "hover":
//			return launchJVM(HOVER_XMI_JAR, List.of("-Xss10m", "-Dquarkus.http.port="+port, "-DNabla.workspaceResource/mp-rest/url="+workspaceUrl, JAEGER_ENDPOINT) );
//		case "references":
//			return launchJVM(REFERENCES_XMI_JAR, List.of("-Xss10m", "-Dquarkus.http.port="+port, "-DNabla.workspaceResource/mp-rest/url="+workspaceUrl, "-DNabla.workspaceResource/mp-rest/url="+workspaceUrl, JAEGER_ENDPOINT) );
//		case "rename":
//			return launchJVM(RENAME_XMI_JAR, List.of("-Xss10m", "-Dquarkus.http.port="+port, "-DNabla.workspaceResource/mp-rest/url="+workspaceUrl, JAEGER_ENDPOINT) );
//		case "symbol":
//			return launchJVM(SYMBOL_XMI_JAR, List.of("-Xss10m", "-Dquarkus.http.port="+port, "-DNabla.workspaceResource/mp-rest/url="+workspaceUrl, "-DNabla.workspaceResource/mp-rest/url="+workspaceUrl, JAEGER_ENDPOINT) );
//		default:
//			return Optional.empty();
//		}
		
		return Optional.empty();

	}
	
//	@Override
//	protected Optional<Process> deployWorkspace(int port, int numberOfServices) {
//		String storageUrl = getServiceUrls().get("storage");
//		return launchJVM(WORKSPACE_XMI_JAR, List.of("-Xss10m", "-Dquarkus.http.port="+port, "-DNabla.storageResource/mp-rest/url="+storageUrl, "-DNabla.routerResource/mp-rest/url=http://localhost:"+(8080+numberOfServices), JAEGER_ENDPOINT ) ); // assume Router is the last deployed
//	}
}
