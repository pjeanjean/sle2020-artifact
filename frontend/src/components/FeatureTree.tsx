import React from "react";
import List from '@material-ui/core/List';
import ListItemText from '@material-ui/core/ListItemText';
import Checkbox from '@material-ui/core/Checkbox';
import ListItem from '@material-ui/core/ListItem';
import ListItemIcon from '@material-ui/core/ListItemIcon';
import Select from '@material-ui/core/Select';
import MenuItem from '@material-ui/core/MenuItem';
import ExpandLess from '@material-ui/icons/ExpandLess';
import ExpandMore from '@material-ui/icons/ExpandMore';
import Collapse from '@material-ui/core/Collapse';

type FeatureTreeState = {
    collapsedFeatures: string[]
}

type Tree = {
    name: string
    children: Tree[]
}

type FeatureTreeProps = {
    tree: Tree
    selectedFeatures: string[]
    handleFeatureSelection: (feature: string) => void
}

export class FeatureTree extends React.Component<FeatureTreeProps,FeatureTreeState> {

    constructor(props : FeatureTreeProps) {
        super(props);
        this.state = {collapsedFeatures: []};
    }



    handleCollapse(feat : string) : void {
        const index = this.state.collapsedFeatures.indexOf(feat)
        const newSelection = [...this.state.collapsedFeatures]
        if(index === -1) {
            newSelection.push(feat)
        }
        else {
            newSelection.splice(index,1)
        }
        this.setState({collapsedFeatures: newSelection})
    }

    render() {
        return (
            <List dense style={{width: '100%',maxWidth: 360,paddingLeft:20}}>
                <ListItem dense>
                    <ListItemIcon>
                    <Checkbox checked={this.props.selectedFeatures.indexOf(this.props.tree.name) !== -1} onClick={()=>this.props.handleFeatureSelection(this.props.tree.name)}></Checkbox>
                    </ListItemIcon>
                    <ListItemText primary={this.props.tree.name} />
                    {
                        (this.props.tree.children.length !== 0) ? 
                            ((this.state.collapsedFeatures.indexOf(this.props.tree.name) !== -1) ?
                                <ExpandLess onClick={()=>this.handleCollapse(this.props.tree.name)} /> 
                                :
                                <ExpandMore onClick={()=>this.handleCollapse(this.props.tree.name)} />)
                            :
                            <div/>
                    }
                </ListItem>
            {
                this.props.tree.children.map(feat => 
                    <Collapse in={this.state.collapsedFeatures.indexOf(this.props.tree.name) !== -1} timeout="auto" unmountOnExit>
                        <FeatureTree tree={{name:feat.name, children:feat.children}} selectedFeatures={this.props.selectedFeatures} handleFeatureSelection={this.props.handleFeatureSelection} />
                    </Collapse>
                )
            }
            </List>
        );
    }
}
