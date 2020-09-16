import React from "react";
import Typography from '@material-ui/core/Typography';
import ListItemText from '@material-ui/core/ListItemText';
import List from '@material-ui/core/List';
import Divider from '@material-ui/core/Divider';
import Button from '@material-ui/core/Button';
import ListItem from '@material-ui/core/ListItem';
import CircularProgress from '@material-ui/core/CircularProgress';
import CloudUpload from '@material-ui/icons/CloudUpload';
import CloudQueue from '@material-ui/icons/CloudQueue';
import Done from '@material-ui/icons/Done';
import { deploy } from "./Helm";

type DeploymentProgressState = {

}

type DeploymentProgressProps = {
    config: NodeConfig[]
}

type NodeConfig = {
    nodeName: string
    features: string[]
}

export default class DeploymentProgressComponent extends React.Component<DeploymentProgressProps, DeploymentProgressState> {

    constructor(props: any) {
        super(props);

        this.processDeployment = this.processDeployment.bind(this)
    }

    render() {
        return (
            <div style={{ width: 250, margin: 10 }}>
                {
                    this.props.config.map(nodeConfig => {
                        return (
                            <List>
                                <ListItem>
                                    <CloudQueue style={{marginRight: 5}}/>
                                    <ListItemText primary={nodeConfig.nodeName} />
                                </ListItem>
                                <Divider />
                                {
                                    nodeConfig.features.map(feature => {
                                        return (
                                            <ListItem>
                                                <ListItemText primary={feature} />
                                                <Done style={{marginLeft: 5}}/>
                                                {/* <CircularProgress style={{marginLeft: 5}} size={30} /> */}
                                            </ListItem>
                                        )
                                    })
                                }
                            </List>
                        )
                    })
                }
                <Button variant="contained" color="primary" onClick={this.processDeployment}>
                    Deploy
                    <CloudUpload style={{marginLeft: 5}} />
                </Button>
            </div>
        )
    }

    processDeployment() {

        for(var conf of this.props.config) {
            console.log("Deploy : [" + conf.features + "] on [" + conf.nodeName +"]");
            
        }

        const requests = []
        for(var nodeConf of this.props.config) {
            for(var feat of nodeConf.features) {
                requests.push(
                    {
                    featureName: feat,
                    deploymentLocation: nodeConf.nodeName
                    }
                )
            }
        }
        
        this.httpPost("http://localhost:8080/deploy", JSON.stringify(requests))
    }

    httpPost(url: string, body: string): string {

        var xmlHttp = new XMLHttpRequest();
        xmlHttp.open("POST", url, false);
        xmlHttp.send(body);
        return xmlHttp.responseText;
      }
}

