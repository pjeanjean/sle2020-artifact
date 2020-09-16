import React, { ChangeEvent } from "react";
import List from '@material-ui/core/List';
import ListItem from '@material-ui/core/ListItem';
import ListItemText from '@material-ui/core/ListItemText';
import Divider from '@material-ui/core/Divider';
import Button from '@material-ui/core/Button';
import CloudUpload from '@material-ui/icons/CloudUpload';

type FileListState = {

}

type FileListProps = {
    title : string,
    files : string[]
    openFile : (file : string) => void
    uploadFiles : (files : FileList | null) => void
}

export class FileListComponent extends React.Component<FileListProps,FileListState> {

    render() {
        return (
            <List dense >
                <ListItemText primary={this.props.title} />
                <Divider />
                {
                    this.props.files.map( file => {
                        return (
                        <ListItem button onDoubleClick={() => this.props.openFile(file)}>
                            <ListItemText primary={getSimpleName(file)} />
                        </ListItem>
                        )
                    })
                }
                <Button variant="contained" component="label" color="primary">
                    Upload
                    <CloudUpload style={{marginLeft: 5}} />
                    <input type="file" style={{ display: "none" }} onChange={(event: ChangeEvent<HTMLInputElement>) => this.props.uploadFiles(event.target.files)} />
                </Button>
            </List>
        )
    }

}

function getSimpleName(file : string) : string {
    const startPos = file.indexOf("/")
    const endPos = file.lastIndexOf(".")

    if(endPos !== -1) {
        return file.slice(startPos + 1, endPos)
    }

    return file
}

function httpPost(url : string, body : string) : string {
    var xmlHttp = new XMLHttpRequest();
    xmlHttp.open( "POST", url, false );
    xmlHttp.send( body );
    return xmlHttp.responseText;
}
