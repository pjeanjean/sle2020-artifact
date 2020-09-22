import React from "react";
import Stepper from '@material-ui/core/Stepper';
import Step from '@material-ui/core/Step';
import StepLabel from '@material-ui/core/StepLabel';
import Button from '@material-ui/core/Button';
import Typography from '@material-ui/core/Typography';
import Grid from '@material-ui/core/Grid';
import Next from '@material-ui/icons/NavigateNext';
import Before from '@material-ui/icons/NavigateBefore';
import { FeatureTree } from './FeatureTree';
import DeploymentConfiguratorComponent from "./DeploymentConfiguratorComponent";
import DeploymentProgressComponent from "./DeploymentProgressComponent";

type DeploymentConfigurationState = {
  selectedFeatures: string[]
  isConfigurationValid : boolean
  deploymentConfiguration: NodeConfig[]
  activeStep: number
}

type DeploymentConfigurationProps = {
  features: string[]
  nodes: string[]
}

type NodeConfig = {
  nodeName: string
  features: string[]
}

// const locations = ["local node", "cluster node 1", "cluster node 2"]

export default class DeploymentCreatorComponent extends React.Component<DeploymentConfigurationProps, DeploymentConfigurationState> {

  steps = this.getSteps();

  constructor(props: any) {
    super(props);
    // const initConf: NodeConfig[] = this.props.nodes.map(loc => (
    //   {
    //     nodeName: loc,
    //     features: []
    //   })
    // )

    let initConf = this.getInitialConfiguration()
    console.log(initConf);
    
    for(var node of this.props.nodes) {
      const find = initConf.find(n => n.nodeName == node)
      if(find == undefined) {
        initConf.push({
          nodeName: node,
          features: []
        })
      }
    }
    // if(initConf.length == 0) {
    //   initConf = this.props.nodes.map(loc => (
    //       {
    //         nodeName: loc,
    //         features: []
    //       })
    //     )
    // }

    const selectedFeatures: string[] = []
    for(var nodeConf of initConf) {
      for(var feature of nodeConf.features) {
        selectedFeatures.push(feature)
      }
    }

    this.state = { selectedFeatures: selectedFeatures, isConfigurationValid: false, deploymentConfiguration: initConf, activeStep: 0 }

    this.handleNext = this.handleNext.bind(this)
    this.handleBack = this.handleBack.bind(this)
    this.handleFeatureSelection = this.handleFeatureSelection.bind(this)
    this.changeFeaturesInNode = this.changeFeaturesInNode.bind(this)
  }

  render() {
    return (
      <Grid
        container
        direction="column"
        justify="center"
        alignItems="center"
      >
        <Stepper activeStep={this.state.activeStep}>
          {this.steps.map(step => {
            return (
              <Step>
                <StepLabel>{step}</StepLabel>
              </Step>
            )
          })}
        </Stepper>
        <div>
          <Button variant="contained" color="primary" onClick={this.handleBack} disabled={this.state.activeStep === 0} style={{margin: 5}} > <Before style={{marginRight: 5}} /> Back </Button>
          <Button variant="contained" color="primary" onClick={this.handleNext} disabled={this.state.activeStep === this.steps.length - 1} style={{margin: 5}} >Next <Next style={{marginLeft: 5}} /></Button>
        </div>
        {this.getStepContent(this.state.activeStep)}
      </Grid>
    );
  }

  handleNext() {
    this.setState(
      {
        activeStep: this.state.activeStep + 1
      }
    )
  }

  handleBack() {
    this.setState(
      {
        activeStep: this.state.activeStep - 1
      }
    )
  }

  handleFeatureSelection(feat: string): void {
    const index = this.state.selectedFeatures.indexOf(feat)
    const newSelection = [...this.state.selectedFeatures]
    if (index === -1) {
      newSelection.push(feat)
    }
    else {
      newSelection.splice(index, 1)
      this.removeFeatureFromDeployment(feat)
    }

    let features = newSelection.join("\n")
    features = features + "\nrouter"
    const isValid = this.httpPost("http://localhost:7070/configuration",features) == 'true'
    console.log(isValid);

    this.setState({ selectedFeatures: newSelection, isConfigurationValid: isValid })
  }

  removeFeatureFromDeployment(feat: string): void {
    const newConf = [...this.state.deploymentConfiguration]
    for (var conf of newConf) {
      const index = conf.features.indexOf(feat)
      if (index !== -1) {
        conf.features.splice(index, 1)
      }
    }
    this.setState({ deploymentConfiguration: newConf })
  }

  changeFeaturesInNode(features: string[], node: string): void {
    const newConf = [...this.state.deploymentConfiguration]
    const nodeConf = newConf.find(conf => conf.nodeName === node)
    if (nodeConf !== undefined) {
      nodeConf.features = features
      this.setState({ deploymentConfiguration: newConf })
    }
  }

  getStepContent(step: number) {

    const tree = this.httpGet("http://localhost:7070/model")
    const featureTree = JSON.parse(tree);

    switch (step) {
      case 0:
        return <Grid container direction="row">
          <Grid item xs={12} style={{textAlign: "center"}}>
              {this.state.isConfigurationValid ? <div>Valid configuration</div> : <b style={{color: 'red'}}>Invalid configuration</b>}
          </Grid>
          <Grid item xs={12} style={{textAlign: "center"}}>
            <FeatureTree tree={featureTree.tree} selectedFeatures={this.state.selectedFeatures} handleFeatureSelection={this.handleFeatureSelection} />
          </Grid>
        </Grid>
      case 1:
        return <DeploymentConfiguratorComponent allFeatures={this.featureToServices(this.state.selectedFeatures)} nodes={this.state.deploymentConfiguration} changeFeaturesInNode={this.changeFeaturesInNode} />;
      case 2:
        return <DeploymentProgressComponent config={this.state.deploymentConfiguration} />;
      default:
        return <Typography>Unknown step</Typography>;
    }
  }

  featureToServices(selectedFetures: string[]) : string[] {
    return selectedFetures.filter(feature => !feature.startsWith("IDE_for"))
  }

  getSteps(): string[] {
    return ['Feature selection', 'Deployment configuration', 'Deployment status'];
  }

  getInitialConfiguration(): NodeConfig[] {

    const tree = this.httpGet("http://localhost:7070/model")
    const featureTree = JSON.parse(tree);
    const features = []
    for(var child of featureTree.tree.children) {
      features.push(child.name)
      for(var child2 of child.children) {
        features.push(child2.name)
      }
    }

    const initConf: NodeConfig[] = []
    console.log(features);
    console.log(this.props.nodes);

    const deployment = this.httpGet("http://localhost:8080/deployment")
    const configuration = JSON.parse(deployment);
    for(var featureConf of configuration) {
      const featureName = featureConf.featureName
      const location = featureConf.deploymentLocation
      console.log(featureName+" -> "+location);
      
      let match = features.find(e => e.toLowerCase() == featureName)
      if(match !== undefined && this.props.nodes.includes(location)) {
        const node = initConf.find( (node:NodeConfig) => node.nodeName == location)
        console.log(node);
        if(node == undefined) {
          const newNode = {nodeName : location, features: [match]}
          initConf.push(newNode)
        }
        else {
          node.features.push(match)
        }
      }
    }

    return initConf
  }

  httpPost(url: string, body: string): string {

    var xmlHttp = new XMLHttpRequest();
    xmlHttp.open("POST", url, false);
    xmlHttp.send(body);
    return xmlHttp.responseText;
  }

  httpGet(url: string): string {
    var xmlHttp = new XMLHttpRequest();
    xmlHttp.open("GET", url, false);
    xmlHttp.send(null);
    return xmlHttp.responseText;
  }
}


