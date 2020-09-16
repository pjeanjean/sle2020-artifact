
import React, { ChangeEvent } from "react";
import Button from '@material-ui/core/Button';
import FolderOpen from '@material-ui/icons/FolderOpen';
import { openFile, createMonaco } from "./LSP";
import { Box, Grid, Paper } from "@material-ui/core";
import { FileListComponent } from "./FileListComponent";

type NablaState = {
  files: string[]
}

type NablaProps = {
  routerURL: string
  storageURL: string
}

export default class NablaComponent extends React.Component<NablaProps,NablaState> {

  private editor: monaco.editor.IStandaloneCodeEditor | null

  render() {

    const documentList = JSON.parse(this.requestDocumentList())

    return (
      <Grid container direction="row" justify="center" alignItems="center" spacing={2} >
        <Grid item xs={9}>
            <h1>Nablab editor page</h1>
            <Paper style={{height: "800px" }}>
              <div id="editor-container" style={{height: "800px" }} ></div>
            </Paper>
        </Grid>
        <Grid item xs={3}>
          <FileListComponent title="Nablab files" files={documentList} openFile={this.openEditor} uploadFiles={this.uploadFiles} />
        </Grid>
      </Grid>
    )
  }

  constructor(props: any) {
    super(props);
    this.editor = null
    this.openEditor = this.openEditor.bind(this)
    this.uploadFiles = this.uploadFiles.bind(this)
    this.state = {files: []}
  }

  componentDidMount() {
    if (this.editor !== null) {
      this.editor.dispose()
    }

    const url = this.props.routerURL
    console.log(url);
    const colonPos = url.lastIndexOf(':')
    console.log(colonPos);
    
    const host = url.substring(7 ,colonPos)
    console.log(host);
    
    const port = url.substring(colonPos+1)
    console.log(port);
    
    console.log("LSP connection to : " + host + ":" + port +"/lsp");
    
    this.editor = createMonaco(host,port,'/lsp')
  }

  componentWillUnmount() {

  }

  openEditor(fileUri: string) {
    if (this.editor !== null && fileUri !== undefined) {
      const docContent = this.requestDocument(fileUri)
      openFile(this.editor, fileUri, docContent)
    }
  }

  uploadFiles(files: FileList | null) {
    const storageURL = this.props.storageURL

    if (files !== null && files.length > 0) {
      for (var file of files) {

        var reader = new FileReader();
        reader.onload = function (event) {
          const name = "inmemory:/" + file.name
          console.log(name);

          const fileContent = reader.result as string;
          httpPost(`${storageURL}/update?name=${name}`, fileContent);
        }
        reader.readAsText(file);
      }
      const documentList = JSON.parse(this.requestDocumentList()) as string[]
      this.setState( {files:documentList} )
    }
  }

  requestDocument(fileUri: string): string {
    const diagram = httpGet(`${this.props.storageURL}/document?name=${fileUri}`)
    return diagram
  }

  requestDocumentList(): string {
    const diagram = httpGet(`${this.props.storageURL}/list?extension=nabla`)
    return diagram
  }

}
function httpGet(url: string): string {
  var xmlHttp = new XMLHttpRequest();
  xmlHttp.open("GET", url, false);
  xmlHttp.send(null);
  return xmlHttp.responseText;
}

function httpPost(url: string, body: string): string {

  var xmlHttp = new XMLHttpRequest();
  xmlHttp.open("POST", url, false);
  xmlHttp.send(body);
  return xmlHttp.responseText;
}



