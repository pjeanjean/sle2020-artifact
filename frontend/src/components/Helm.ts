
type DeployedFeature = {
    featureName: string,
    deploymentLocation: string
}

export function deploy(config: DeployedFeature[]) {

    const DEPLOYMENT_MANAGER_SERVICE = `http://172.19.0.3:8081/deploy`
    const body = JSON.stringify(config)

    httpPost(DEPLOYMENT_MANAGER_SERVICE, body)
}

function httpPost(url : string, body : string) : string {

    var xmlHttp = new XMLHttpRequest();
    xmlHttp.open( "POST", url, false );
    xmlHttp.setRequestHeader("Content-Type", "application/json");
    xmlHttp.send(body);
    return xmlHttp.responseText;
  }