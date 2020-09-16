require('monaco-editor-core');
(self as any).MonacoEnvironment = {
    getWorkerUrl: () => './editor.worker.js'
};

import { listen, MessageConnection } from 'vscode-ws-jsonrpc';
import {
    MonacoLanguageClient, CloseAction, ErrorAction,
    MonacoServices, createConnection
} from 'monaco-languageclient';
import normalizeUrl = require('normalize-url');
const ReconnectingWebSocket = require('reconnecting-websocket');




let monaco = require("monaco-editor-core");

monaco.languages.register({
    id: 'nabla',
    extensions: ['.nabla'],
    aliases: ['NABLA', 'nabla'],
    mimetypes: ['application/nabla'],
}
// ,
// {
//     id: 'logo',
//     extensions: ['.logo'],
//     aliases: ['LOGO', 'logo'],
//     mimetypes: ['application/logo'],
// },
// {
//     id: 'thingml',
//     extensions: ['.thingml'],
//     aliases: ['THINGML', 'thingml'],
//     mimetypes: ['application/thingml'],
// }
);

monaco.languages.setMonarchTokensProvider("nabla", {
    // Set defaultToken to invalid to see what you do not tokenize yet
    // defaultToken: 'invalid',

    keywords: [
        "\u2115",
        "\u211D",
        "\u211D\u00B2",
        "\u211D\u00B2\u02E3\u00B2",
        "\u211D\u00B3",
        "\u211D\u00B3\u02E3\u00B3",
        "\u213E",
        "\u2192",
        "\u2200",
        "\u2205",
        "\u2208",
        "\u25BA",
        "\u25C4",
        "cell",
        "connectivities",
        "const",
        "else",
        "face",
        "false",
        "functions",
        "if",
        "module",
        "node",
        "true",
        "with"
    ],

    typeKeywords: [
        "boolean",
        "double",
        "byte",
        "int",
        "short",
        "char",
        "void",
        "long",
        "float"
    ],

    operators: [
        "=",
        ">",
        "<",
        "!",
        "~",
        "?",
        ":",
        "==",
        "<=",
        ">=",
        "!=",
        "&&",
        "||",
        "++",
        "--",
        "+",
        "-",
        "*",
        "/",
        "&",
        "|",
        "^",
        "%",
        "<<",
        ">>",
        ">>>",
        "+=",
        "-=",
        "*=",
        "/=",
        "&=",
        "|=",
        "^=",
        "%=",
        "<<=",
        ">>=",
        ">>>="
    ],

    // we include these common regular expressions
    symbols: /[=><!~?:&|+\-*\/\^%]+/,

    // C# style strings
    escapes: /\\(?:[abfnrtv\\"']|x[0-9A-Fa-f]{1,4}|u[0-9A-Fa-f]{4}|U[0-9A-Fa-f]{8})/,

    // The main tokenizer for our languages
    tokenizer: {
        root: [
            // identifiers and keywords
            [
                /[a-zA-Z\u0394-\u03F2\u220F-\u221C_][a-zA-Z\u0394-\u03F20-9\u2211_]*/,
                {
                    cases: {
                        "@typeKeywords": "keyword",
                        "@keywords": "keyword",
                        "@default": "identifier"
                    }
                }
            ],
            [/[A-Z][\w\$]*/, "type.identifier"], // to show class names nicely

            // whitespace
            { include: "@whitespace" },

            // delimiters and operators
            [/[{}()\[\]]/, "@brackets"],
            [/[<>](?!@symbols)/, "@brackets"],
            [
                /@symbols/,
                {
                    cases: {
                        "@operators": "operator",
                        "@default": ""
                    }
                }
            ],

            // @ annotations.
            // As an example, we emit a debugging log message on these tokens.
            // Note: message are supressed during the first load -- change some lines to see them.
            [
                /@\s*[a-zA-Z_\$][\w\$]*/,
                { token: "annotation", log: "annotation token: $0" }
            ],

            // numbers
            [/\d*\.\d+([eE][\-+]?\d+)?/, "number.float"],
            [/0[xX][0-9a-fA-F]+/, "number.hex"],
            [/\d+/, "number"],

            // delimiter: after number because of .\d floats
            [/[;,.]/, "delimiter"],

            // strings
            [/"([^"\\]|\\.)*$/, "string.invalid"], // non-teminated string
            [/"/, { token: "string.quote", bracket: "@open", next: "@string" }],

            // characters
            [/'[^\\']'/, "string"],
            [/(')(@escapes)(')/, ["string", "string.escape", "string"]],
            [/'/, "string.invalid"]
        ],

        comment: [
            [/[^\/*]+/, "comment"],
            [/\/\*/, "comment", "@push"], // nested comment
            ["\\*/", "comment", "@pop"],
            [/[\/*]/, "comment"]
        ],

        string: [
            [/[^\\"]+/, "string"],
            [/@escapes/, "string.escape"],
            [/\\./, "string.escape.invalid"],
            [/"/, { token: "string.quote", bracket: "@close", next: "@pop" }]
        ],

        whitespace: [
            [/[ \t\r\n]+/, "white"],
            [/\/\*/, "comment", "@comment"],
            [/\/\/.*$/, "comment"]
        ]
    }
} as any);

function createLanguageClient(connection: MessageConnection): MonacoLanguageClient {
    return new MonacoLanguageClient({
        name: "Monaco Language Client",
        clientOptions: {
            // use a language id as a document selector
            documentSelector: ['nabla'],
            // disable the default error handler
            errorHandler: {
                error: () => ErrorAction.Continue,
                closed: () => CloseAction.DoNotRestart
            }
        },
        // create a language client connection from the JSON RPC connection on demand
        connectionProvider: {
            get: (errorHandler, closeHandler) => {
                return Promise.resolve(createConnection(connection, errorHandler, closeHandler))
            }
        }
    });
}

export function createMonaco(host: string, port: string, path: string) {
    let editor = monaco.editor.create(document.getElementById("editor-container")!, {
        glyphMargin: true,
        lightbulb: {
            enabled: true
        }
    });
    MonacoServices.install(editor);

    // const url = createUrl('localhost', '8080', '/lsp')
    const url = createUrl(host, port, path)
    const webSocket = createWebSocket(url);
    listen({
        webSocket,
        onConnection: connection => {
            // create and start the language client
            const languageClient = createLanguageClient(connection);
            const disposable = languageClient.start();
            connection.onClose(() => disposable.dispose());
        }
    });

    return editor
}

function openInMonaco(editor: monaco.editor.IStandaloneCodeEditor, documentURI: string, fileContent: string): void {

    if(fileContent != undefined) {
        let MONACO_URI = monaco.Uri.parse(documentURI);
        let LANGUAGE_ID = 'nabla';
    
        if(editor.getModel() !== null) {
            editor.getModel().dispose();
        }
        const newModel = monaco.editor.createModel(fileContent, LANGUAGE_ID, MONACO_URI)
        editor.setModel(newModel)
        
    }
}

export function openFile(editor: monaco.editor.IStandaloneCodeEditor, fileUri: string, fileContent : string): void {

    var uri = "inmemory:/" + fileUri;
    var body = JSON.stringify(
        {
            "method": "textDocument/didOpen",
            "jsonrpc": "2.0",
            "params": {
                "textDocument": {
                    "languageId": "nabla",
                    "text": fileContent,
                    "uri": uri,
                    "version": 1
                }
            }
        });
    // var rsp = httpPost('http://localhost:8081/workspace/didOpen', body)
    openInMonaco(editor, fileUri, fileContent)
}

function createUrl(host: string, port: string, path: string): string {
    const protocol = location.protocol === 'https:' ? 'wss' : 'ws';
    return normalizeUrl(`${protocol}://${host}:${port}${path}`);
}

function createWebSocket(url: string): WebSocket {
    const socketOptions = {
        maxReconnectionDelay: 10000,
        minReconnectionDelay: 1000,
        reconnectionDelayGrowFactor: 1.3,
        connectionTimeout: 10000,
        maxRetries: Infinity,
        debug: false
    };
    return new ReconnectingWebSocket(url, undefined, socketOptions);
}

function httpGet(url : string) : string {
    var xmlHttp = new XMLHttpRequest();
    xmlHttp.open( "GET", url, false );
    xmlHttp
    xmlHttp.send( null );
    return xmlHttp.responseText;
}

function httpPost(url : string, body : string) : string {

  var xmlHttp = new XMLHttpRequest();
  xmlHttp.open( "POST", url, false );
  xmlHttp.send( body );
  return xmlHttp.responseText;
}


