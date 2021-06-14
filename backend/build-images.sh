#!/bin/bash

mvn clean install

cd lsp/lsp-router
mvn package
docker build -f src/main/docker/Dockerfile.jvm -t kaulua/lsp-router .
cd ../..

cd document-storage
mvn package
docker build -f src/main/docker/Dockerfile.jvm -t kaulua/document-storage .
cd ..

