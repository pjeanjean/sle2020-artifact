import React from "react";
import Drawer from '@material-ui/core/Drawer';
import ListItem from '@material-ui/core/ListItem';
import List from '@material-ui/core/List';
import ListItemIcon from '@material-ui/core/ListItemIcon';
import ListItemText from '@material-ui/core/ListItemText';
import PowerSettingsNew from '@material-ui/icons/PowerSettingsNew';
import FormatAlignJustify from '@material-ui/icons/FormatAlignJustify';
import Settings from '@material-ui/icons/Settings';
import ScatterPlot from '@material-ui/icons/ScatterPlot';
import { makeStyles, createStyles, Theme } from '@material-ui/core/styles';
import { Link } from "react-router-dom";
import { render } from "react-dom";

const drawerWidth = 240;
const toolbarHeight = 64;

type DrawerProps = {
  deployedFeatures: string[]
}

type DrawerState = {

}

export default class DrawerComponent extends React.Component<DrawerProps, DrawerState> {

  render() {
    return (
      <div style={{display: 'flex'}}>
        <Drawer
          style={{ width: drawerWidth, flexShrink: 0}}
          variant="permanent"
        >
          <div style={{ height: toolbarHeight}}/>
          <List>
            {/* <Link to='/connection' style={{ textDecoration: 'none' }}>
              <ListItem button key="Connection">
                <ListItemIcon>
                  <PowerSettingsNew />
                </ListItemIcon>
                <ListItemText primary="Connection" />
              </ListItem>
            </Link> */}
            <Link to='/deploy' style={{ textDecoration: 'none' }}>
              <ListItem button key="New deployment">
                <ListItemIcon>
                  <Settings />
                </ListItemIcon>
                <ListItemText primary="New deployment" />
              </ListItem>
            </Link>

            {
              (this.props.deployedFeatures.indexOf("Text editor") !== -1) ? 
              <Link to='/nabla' style={{ textDecoration: 'none' }}>
                <ListItem button key="Nablab editor">
                  <ListItemIcon>
                    <FormatAlignJustify />
                  </ListItemIcon>
                  <ListItemText primary="Nablab editor" />
                </ListItem>
              </Link>
              : <div></div>
            }

            {
              (this.props.deployedFeatures.indexOf("Diagram view") !== -1) ? 
              <Link to='/nablair' style={{ textDecoration: 'none' }}>
                <ListItem button key="Graphical representation">
                  <ListItemIcon>
                    <ScatterPlot />
                  </ListItemIcon>
                  <ListItemText primary="Graphical representation" />
                </ListItem>
              </Link>
              : <div></div>
            }
            
          </List>
        </Drawer>
      </div>
    );
  }
}


  // { (this.state.deployedFeatures.indexOf("Text editor") !== -1)? <Route path="/nabla/" component={NablaComponent} /> : <div></div>}
  // { (this.state.deployedFeatures.indexOf("Diagram view") !== -1)? <Route path="/nablair/" component={DiagramComponent} /> : <div></div> }