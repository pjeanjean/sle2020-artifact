import React from 'react';
import ReactDOM from 'react-dom';
import Button from '@material-ui/core/Button';
import {FeatureTree} from './components/FeatureTree';
import {App} from './components/App';
import { BrowserRouter, Route } from "react-router-dom";

// function App() {
//   return (
//     <Button variant="contained" color="primary">
//       Hello World
//     </Button>
//   );
// }

const locations = ["local", "browser", "node 1", "node 2"]

const featureTree = {
  name: "Workbench",
  children: [
    { name: "Completion", children: [], locations: locations },
    { name: "Definition", children: [], locations: locations },
    { name: "DocumentHighlight", children: [], locations: locations },
    { name: "DocumentSymbol", children: [],locations: locations },
    { name: "Formatting", children: [], locations: locations },
    { name: "Hover", children: [], locations: locations },
    { name: "Reference", children: [], locations: locations },
    { name: "Rename", children: [], locations: locations },
    { name: "Symbol", children: [], locations: locations }
  ],
  locations: locations
}

function httpGet(url: string): string {
  var xmlHttp = new XMLHttpRequest();
  xmlHttp.open("GET", url, false);
  xmlHttp.send();
  return xmlHttp.responseText;
}

  const clusterInspectorURL = 'http://localhost:8080'

  const url = `${clusterInspectorURL}/urls`
  const urls: any = JSON.parse(httpGet(url));
  console.log(urls);

  const routerURL = urls.services.find((elem: any) => elem.service == 'router').url;
  console.log(routerURL);
  const storageURL = urls.services.find((elem: any) => elem.service == 'storage').url;
  console.log(storageURL);

  const deploymentURL = `${clusterInspectorURL}/views`
  const deployedFeatures: string[] = JSON.parse(httpGet(deploymentURL));

  console.log(deployedFeatures);


  const nodesURL = `${clusterInspectorURL}/nodes`
  const nodes = JSON.parse(httpGet(nodesURL))
  console.log(nodes);
  


// ReactDOM.render(<FeatureTree name={featureTree.name} children={featureTree.children} locations={locations} />, document.getElementById("example"));
ReactDOM.render(
<BrowserRouter>
  <App routerURL={routerURL} storageURL={storageURL} deployedFeatures={deployedFeatures} clusterNodes={nodes}/>
</BrowserRouter>
, document.getElementById("main"));
