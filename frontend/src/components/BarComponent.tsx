import React from "react";
import AppBar from '@material-ui/core/AppBar';
import Toolbar from '@material-ui/core/Toolbar';
import Typography from '@material-ui/core/Typography';
import Details from '@material-ui/icons/Details';
import { makeStyles, createStyles, Theme } from '@material-ui/core/styles';

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      flexGrow: 1,
      zIndex: theme.zIndex.drawer + 1,
    },
    icon: {
      marginRight: theme.spacing(2),
    },
  }),
);

export default function BarComponent() {
  const classes = useStyles();

  return (
    <div className={classes.root}>
      <AppBar position="static">
        <Toolbar>
        <Details className={classes.icon} />
        <Typography variant="h6" noWrap>
          Nablab Web
        </Typography>
        </Toolbar>
      </AppBar>
    </div>
  );
}