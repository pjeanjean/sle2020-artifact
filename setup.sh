#!/bin/bash

# INSTALL FIREFOX
sudo dnf install -y firefox

# INSTALL KIND
cd
mkdir kind
cd kind
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.9.0/kind-linux-amd64
chmod +x ./kind
echo export PATH="~/kind:\$PATH" >> ~/.bashrc

# INSTALL KUBECTL
sudo dnf config-manager --add-repo https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
sudo dnf install --nogpgcheck -y kubectl

# INSTALL JAVA 11
cd
mkdir java
cd java
curl -Lo ./java11.tar.gz https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_linux-x64_bin.tar.gz
tar -xzf java11.tar.gz
echo export PATH="~/java/jdk-11/bin:\$PATH" >> ~/.bashrc

# INSTALL MAVEN
cd
curl -Lo maven.tar.gz http://apache.crihan.fr/dist/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
tar -xzf maven.tar.gz
echo export PATH="~/apache-maven-3.6.3/bin:\$PATH" >> ~/.bashrc

# INSTALL DOCKER
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install -y docker-ce docker-ce-cli containerd.io
sudo systemctl enable docker

# INSTALL NPM
sudo dnf install -y npm

# INSTALL HTTP-SERVER
npm install --global http-server

# INSTALL ECLIPSE
cd
curl -Lo ./eclipse.tar.gz http://mirror.dkm.cz/eclipse/technology/epp/downloads/release/2020-09/R/eclipse-dsl-2020-09-R-linux-gtk-x86_64.tar.gz
tar -xzf eclipse.tar.gz
