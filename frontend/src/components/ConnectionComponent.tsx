import React, { ChangeEvent } from "react";
import { Typography, TextField, Button } from "@material-ui/core";

type ConnectionProps = {
  isConnected: boolean
  ip: string
  connect: (ip: string) => void
  disconnect: () => void
}

type ConnectionState = {
  ipValue: string
}

export default class ConnectionComponent extends React.Component<ConnectionProps, ConnectionState> {

  constructor(props: ConnectionProps) {
    super(props);
    this.state = {ipValue: ""}
  }

  render() {
    return (
      (this.props.isConnected === false) ? this.logger() : this.connectionStatus()
    );
  }

  logger() {
    return (
      <div>
        <Typography component="h1" variant="h5">
          Enter the IP and Port:
              </Typography>
        <form>
          <TextField label="IP:Port"
            value={this.state.ipValue}
            onChange={e => this.setState({ipValue: e.target.value})}
          />
          <Button onClick={() => this.props.connect(this.state.ipValue)} >Connect</Button>
        </form>
      </div>
    )
  }

  connectionStatus() {
    return (
      <div>
        <Typography component="h1" variant="h5">
          You are connected to {this.props.ip}
        </Typography>
        <Button onClick={() => this.props.disconnect()} >Disconnect</Button>
      </div>
    )
  }
}
