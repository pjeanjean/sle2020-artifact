import React from "react";
import BarComponent from "./BarComponent";
import DrawerComponent from "./DrawerComponent";
import { Route, Switch } from "react-router-dom";
import HomeComponent from "./HomeComponent";
import ConnectionComponent from "./ConnectionComponent";
import DeploymentCreatorComponent from "./DeploymentCreatorComponent";
import NablaComponent from "./NablaComponent";
import Container from '@material-ui/core/Container';
import CssBaseline from '@material-ui/core/CssBaseline';
import { element } from "prop-types";

type AppState = {
    isConnected: boolean
    ip: string
}

type AppProps = {
    deployedFeatures: string[]
    clusterNodes: string[],
    routerURL: string,
    storageURL: string
}

export class App extends React.Component<AppProps, AppState> {

    constructor(props: any) {
        super(props);

        this.state = {
            isConnected: false,
            ip: "",
        }
        // this.connect = this.connect.bind(this)
        // this.disconnect = this.disconnect.bind(this)

        // this.askInspector()
    }

    render() {
        return (
            <div>
                <CssBaseline />
                <div style={{ display: 'flex', }}>
                    <BarComponent />
                </div>
                <DrawerComponent deployedFeatures={this.props.deployedFeatures} />
                <Container>
                    <Switch>
                        <Route path="/" exact component={HomeComponent} />
                        {/* <Route path="/connection/" component={ () => <ConnectionComponent isConnected={this.state.isConnected} ip={this.state.ip} connect={this.connect} disconnect={this.disconnect} /> } /> */}
                        <Route path="/deploy/" component={() => <DeploymentCreatorComponent features={this.props.deployedFeatures} nodes={this.props.clusterNodes} /> } />
                        <Route path="/nabla/" component={ () => <NablaComponent routerURL={this.props.routerURL} storageURL={this.props.storageURL} /> } />
                    </Switch>
                </Container>
            </div>
        )

    }

    // connect(ip: string) {

    //     const url = `http://${ip}/deployment`

    //     const deployedFeatures: string[] = JSON.parse(httpGet(url));
    //     console.log(deployedFeatures);

    //     this.setState({ isConnected: true, ip: ip, deployedFeatures: deployedFeatures })
    // }

    // disconnect() {
    //     this.setState({ isConnected: false, ip: "", deployedFeatures: [] })
    // }

    // askInspector() {
    //     const url = `http://localhost:8080/urls`
    //     const urls: any = JSON.parse(httpGet(url));
    //     console.log(urls);

    //     const deployerURL = urls.services.find((elem: any) => elem.service == 'deployer').url;
    //     const routerURL = urls.services.find((elem: any) => elem.service == 'router').url;
    //     const diagramURL = urls.services.find((elem: any) => elem.service == 'diagram').url;
    //     const formURL = urls.services.find((elem: any) => elem.service == 'form').url;
    //     const storageURL = urls.services.find((elem: any) => elem.service == 'storage').url;
    //     console.log(storageURL);

    //     const deploymentURL = `${deployerURL}/deployment`
    //     const deployedFeatures: string[] = JSON.parse(httpGet(deploymentURL));

    //     this.setState({
    //         isConnected: true,
    //         ip: deployerURL,
    //         deployedFeatures: deployedFeatures,
    //         deployerURL: deployerURL,
    //         routerURL: routerURL,
    //         diagramURL: diagramURL,
    //         formURL: formURL,
    //         storageURL: storageURL
    //     })

    // }
}

function httpGet(url: string): string {
    var xmlHttp = new XMLHttpRequest();
    xmlHttp.open("GET", url, false);
    xmlHttp.send();
    return xmlHttp.responseText;
}
