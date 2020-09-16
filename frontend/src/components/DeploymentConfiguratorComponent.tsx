import React from "react";
import Grid from '@material-ui/core/Grid';
import List from '@material-ui/core/List';
import ListItem from '@material-ui/core/ListItem';
import ListItemIcon from '@material-ui/core/ListItemIcon';
import ListItemText from '@material-ui/core/ListItemText';
import Checkbox from '@material-ui/core/Checkbox';
import Button from '@material-ui/core/Button';
import Paper from '@material-ui/core/Paper';
import Box from '@material-ui/core/Box';
import Chip from '@material-ui/core/Chip';
import { Typography } from "@material-ui/core";
import LocationConfigurator from "./LocationConfiguratorComponent";

interface IState {
    locations: ILocationState[]
}

interface ILocationState {
    name: string,
    leftItems: string[],
    rightItems: string[],
    checked: string[]
}

interface IProps {
    nodes: NodeConfig[],
    allFeatures: string[],
    changeFeaturesInNode: (feat: string[], location: string) => void
}

type NodeConfig = {
    nodeName: string
    features: string[]
  }

export default class DeploymentConfiguratorComponent extends React.Component<IProps, IState> {

    constructor(props: any) {
        super(props);

        const initLocations : ILocationState[] = []
        for (let node of this.props.nodes) {           
            initLocations.push(
                {
                    name: node.nodeName,
                    leftItems: not(props.allFeatures,node.features),
                    rightItems: node.features,
                    checked: []
                }
            )
        }
        this.state = {locations: initLocations}

        this.handleAllRight = this.handleAllRight.bind(this)
        this.handleAllLeft = this.handleAllLeft.bind(this)
        this.handleRight = this.handleRight.bind(this)
        this.handleLeft = this.handleLeft.bind(this)
        this.handleToggle = this.handleToggle.bind(this)
    }

    render() {
        
        return (
            <div>
                {
                    this.props.nodes.map(
                        (node: NodeConfig) => {
                            const locationStateIndex = this.state.locations.findIndex(loc => {return loc.name === node.nodeName} )
                            const locationState = this.state.locations[locationStateIndex]
                            return (
                                <LocationConfigurator 
                                location={node.nodeName}
                                leftItems={locationState.leftItems}
                                rightItems={locationState.rightItems}
                                checked={locationState.checked}
                                handleToggle={this.handleToggle}
                                handleAllLeft={this.handleAllLeft}
                                handleAllRight={this.handleAllRight}
                                handleLeft={this.handleLeft}
                                handleRight={this.handleRight}
                                />
                            )
                        }
                    )
                }
            </div>
        )
    }

    handleAllRight = (location: string) => {

        const locationStateIndex = this.state.locations.findIndex(loc => {return loc.name === location} )
        if(locationStateIndex !== -1) {
            const oldLocationState = this.state.locations[locationStateIndex]
            const newLocationStates = [...this.state.locations]
            newLocationStates.splice(locationStateIndex,1)

            const leftChecked = intersection(oldLocationState.leftItems, oldLocationState.checked)
            const newChecked = not(oldLocationState.checked, leftChecked)
            const newLocationState = {
                name: oldLocationState.name,
                leftItems: [],
                rightItems: this.props.allFeatures,
                checked: newChecked
            }

            newLocationStates.push(newLocationState)
            this.setState(
                {locations: newLocationStates}
            )
            this.props.changeFeaturesInNode(newLocationState.rightItems, location)
        }

    }

    handleAllLeft = (location: string) => {

        const locationStateIndex = this.state.locations.findIndex(loc => {return loc.name === location} )
        if(locationStateIndex !== -1) {
            const oldLocationState = this.state.locations[locationStateIndex]
            const newLocationStates = [...this.state.locations]
            newLocationStates.splice(locationStateIndex,1)

            const rightChecked = intersection(oldLocationState.rightItems, oldLocationState.checked)
            const newChecked = not(oldLocationState.checked, rightChecked)
            const newLocationState = {
                name: oldLocationState.name,
                leftItems: this.props.allFeatures,
                rightItems: [],
                checked: newChecked
            }

            newLocationStates.push(newLocationState)
            this.setState(
                {locations: newLocationStates}
            )
            this.props.changeFeaturesInNode(newLocationState.rightItems, location)
        }

    }

    handleRight = (location: string) => {

        const locationStateIndex = this.state.locations.findIndex(loc => {return loc.name === location} )
        if(locationStateIndex !== -1) {
            const oldLocationState = this.state.locations[locationStateIndex]
            const newLocationStates = [...this.state.locations]
            newLocationStates.splice(locationStateIndex,1)

            const leftChecked = intersection(oldLocationState.leftItems, oldLocationState.checked)
            const newChecked = not(oldLocationState.checked, leftChecked)
            const newLeftItems = not(oldLocationState.leftItems, leftChecked)
            const newRightItems = [...oldLocationState.rightItems]
            newRightItems.push(...leftChecked)
            const newLocationState = {
                name: oldLocationState.name,
                leftItems: newLeftItems,
                rightItems: newRightItems,
                checked: newChecked
            }

            newLocationStates.push(newLocationState)
            this.setState(
                {locations: newLocationStates}
            )
            this.props.changeFeaturesInNode(newLocationState.rightItems, location)
        }

    }

    handleLeft = (location: string) => {

        const locationStateIndex = this.state.locations.findIndex(loc => {return loc.name === location} )
        if(locationStateIndex !== -1) {
            const oldLocationState = this.state.locations[locationStateIndex]
            const newLocationStates = [...this.state.locations]
            newLocationStates.splice(locationStateIndex,1)

            const rightChecked = intersection(oldLocationState.rightItems, oldLocationState.checked)
            const newChecked = not(oldLocationState.checked, rightChecked)
            const newRightItems = not(oldLocationState.rightItems, rightChecked)
            const newLeftItems = [...oldLocationState.leftItems]
            newLeftItems.push(...rightChecked)
            const newLocationState = {
                name: oldLocationState.name,
                leftItems: newLeftItems,
                rightItems: newRightItems,
                checked: newChecked
            }

            newLocationStates.push(newLocationState)
            this.setState(
                {locations: newLocationStates}
            )
            this.props.changeFeaturesInNode(newLocationState.rightItems, location)
        }

    }

    handleToggle = (location: string, item: string) => () => {

        const locationStateIndex = this.state.locations.findIndex(loc => {return loc.name === location} )
        if(locationStateIndex !== -1) {
            const oldLocationState = this.state.locations[locationStateIndex]
            const newLocationStates = [...this.state.locations]
            newLocationStates.splice(locationStateIndex,1)

            const newChecked = oldLocationState.checked
            if (oldLocationState.checked.includes(item)) {
                const index = newChecked.indexOf(item);
                newChecked.splice(index, 1)
            }
            else {
                newChecked.push(item)
            }

            const newLocationState = {
                name: oldLocationState.name,
                leftItems: oldLocationState.leftItems,
                rightItems: oldLocationState.rightItems,
                checked: newChecked
            }

            newLocationStates.push(newLocationState)
            this.setState(
                {locations: newLocationStates}
            )
        }

    }

}


function intersection(a: string[], b: string[]) {
    return a.filter(value => b.indexOf(value) !== -1);
}

function not(a: string[], b: string[]) {
    return a.filter(value => b.indexOf(value) === -1);
}