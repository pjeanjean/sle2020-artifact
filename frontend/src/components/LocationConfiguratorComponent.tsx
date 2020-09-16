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

interface IState {
}

interface IProps {
    location: string,
    leftItems: string[],
    rightItems: string[],
    checked: string[],

    handleToggle: (location: string, item: string) => () => void
    handleAllRight: (location: string) => void
    handleAllLeft: (location: string) => void
    handleRight: (location: string) => void
    handleLeft: (location: string) => void
}

export default class LocationConfigurator extends React.Component<IProps, IState> {

    constructor(props: any) {
        super(props);
    }

    render() {
        return (
            <Box border={1} borderRadius="borderRadius" style={{ height: 280, width: 520, padding: 5, margin: 5 }} >
                <Chip label={this.props.location} />
                <Grid container spacing={2} justify="center" alignItems="center" >
                    <Grid item>{this.customList(this.props.leftItems)}</Grid>
                    <Grid item>
                        <Grid container direction="column" alignItems="center">
                            <Button
                                variant="outlined"
                                size="small"
                                onClick={() => this.props.handleAllRight(this.props.location)}
                                disabled={this.props.leftItems.length === 0}
                                aria-label="move all right"
                            >
                                ≫
                            </Button>
                            <Button
                                variant="outlined"
                                size="small"
                                onClick={() => this.props.handleRight(this.props.location)}
                                disabled={intersection(this.props.leftItems, this.props.checked).length === 0}
                                aria-label="move selected right"
                            >
                                &gt;
                            </Button>
                            <Button
                                variant="outlined"
                                size="small"
                                onClick={() => this.props.handleLeft(this.props.location)}
                                disabled={intersection(this.props.rightItems, this.props.checked).length === 0}
                                aria-label="move selected left"
                            >
                                &lt;
                            </Button>
                            <Button
                                variant="outlined"
                                size="small"
                                onClick={() => this.props.handleAllLeft(this.props.location)}
                                disabled={this.props.rightItems.length === 0}
                                aria-label="move all left"
                            >
                                ≪
                            </Button>
                        </Grid>
                    </Grid>
                    <Grid item>{this.customList(this.props.rightItems)}</Grid>
                </Grid>
            </Box>
        )
    }

    customList = (items: string[]) => {

        return (
            <Paper style={{ width: 200, height: 230, overflow: 'auto', }}>
                <List dense component="div" role="list">
                    {items.map((item: string) => {

                        return (
                            <ListItem button onClick={this.props.handleToggle(this.props.location, item)}>
                                <ListItemIcon>
                                    <Checkbox checked={this.props.checked.indexOf(item) !== -1} />
                                </ListItemIcon>
                                <ListItemText primary={item} />
                            </ListItem>
                        );
                    })}
                    <ListItem />
                </List>
            </Paper>
        )
    }
}

function intersection(a: string[], b: string[]) {
    return a.filter(value => b.indexOf(value) !== -1);
}