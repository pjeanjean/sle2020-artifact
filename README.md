# Modular and distributed IDE

## Introduction

You will find in this repository:
 - The Eclipse plugins needed to generate microservices from DSL specifications in the folder `plugins` (source code in the folder `generator`)
 - A web application allowing both to use these microservices and to reconfigure their deployment in the folder `frontend`
 - Scripts to set up a local Kubernetes cluster to be used for the deployment of the microservices
 - The languages NabLab, Logo, MiniJava and ThingML
 - The source code of the monolithic servers in the in the folder `monolithicServers`
 - The source code of the microservices in the in the folders `<LANG_NAME>-ms`
 - The paper Modular and distributed IDE
 - The results of our evaluations in the folder `eval-notebooks` 

## Setup

This artifact is a VM image available here: [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4042582.svg)](https://doi.org/10.5281/zenodo.4042582)

To run the VM, you will need to use [VirtualBox](https://www.virtualbox.org/).

From VirtualBox, open the `File` menu and select `Import Appliance`.
Select the downloaded `DistributedIDE.ova` and press `Next` and `Import`.
You should then see a new VM on the left side of the UI, right-click on it and press `Start`.

**_NOTE:_**  To log in the VM: user is `vagrant` and password is `vagrant`.

## Instructions

This section describes how to generate microservices for the NabLab language, how to deploy them, and to use the web application.

### Microservices generation

Open the folder `/home/vagrant/eclipse` and double click on `eclipse` to launch Eclipse IDE.
Click on the `Launch` button.

The workspace contains the projects `fr.cea.nabla` and `fr.cea.nabla.ide` implementing the language NabLab.

The mains files are located in the project `fr.cea.nabla` :
* `nabla.dsl` : the Nablab language specification
* `nabla.xtext` : the grammar specification
* `nablab.kaulua` : the protocol specification

#### Generate microservices

**Feature model**  
In the project `fr.cea.nabla`, do a right-click on `nabla.dsl` and select `Generate (Feature Model)` > `FM Generator FM`. It will generate the project of the microservice containing the Feature Model used to validate the deployment of microservices. (the generation takes few seconds)

**Microservices**  
In the project `fr.cea.nabla`, do a right-click on `nabla.dsl` and select `Generate (Service)` > `Service Generator`. It will generate the projects for all the microservices implementing the IDE services. (the generation takes around one minute)

**Deployment scripts**  
In the project `fr.cea.nabla`, do a right-click on `nabla.dsl` and select `Generate (Cluster Scripts)` > `Script Generator`. It generates the scripts to build Docker images and provision them in the cluster.

### Microservices deployment

**Feature model build**  
Open a terminal and type `cd ~/eclipse-workspace/feature-model`.  
Type `./build-images.sh` to build the Docker images of the deployment validator microservice for Nablab.

**Microservices build**  
In the same terminal, type `cd ~/eclipse-workspace/nablab`.  
Type `./build-images.sh` to build the Docker images of the microservices for Nablab.

**Local Kubernetes cluster**  
Go back with `cd ~/git/sle2020-artifact` and type `./initCluster.sh ~/eclipse-workspace/nablab` to launch a mini Kubernetes cluster locally and do an initial deployment of the Nablab microservices.  
This command may take a few minutes to complete.

Open a new tab with `Ctrl+Shift+T`.  
Enter the command `./launchInspector.sh`. It will launch a service used to interact with the cluster.

**Serve the web app**  
Open a new tab with `Ctrl+Shift+T` again.  
Enter `cd frontend`.  
Enter `http-server -o`. This command serves the web app and makes it accessible at `localhost:8081`.

### Web application

Open Firefox and enter the URL `localhost:8081` to open the web application connected to the microservices.

#### Usage

There are two menus on the left side: `New deployment` and `Nablab editor`.
Click on `Nablab editor` to access to the NabLab program editor.
On the right side click on the `UPLOAD` button and open the file `git/sle2020-artifact/nablab/Glace2d.nabla` to send a NabLab program in the cluster.
Do a double click on `Glace2d` (which appeared on top of the "UPLOAD" button) to open it in the editor.

The editor is now communicating with the microservices.
For example, error markers are computed by a dedicated microservice and displayed back in the editor.
If you click on the variable `nodes` in the block `connectivities`, you get the positions in the program referring to this symbol.
By doing a right-click and selecting `Rename symbol` you can rename it.
You can also go back to the variable declaration if you do a right-click on a symbol and select `Go to definition`.
All these services are provided by the deployed microservices.

#### Deployment reconfiguration

We will now change the deployment configuration of the microservices.

First, we will inspect the content of the Kubernetes cluster via its Dashboard.
It is available at `http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/cluster?namespace=default`.
The required token is displayed at the end of the logs of the command `./initCluster` (in the first terminal you opened).

In the menu `Cluster` > `Nodes` you can see the three nodes of the cluster `control-plane` and the two `woker` where we deploy the microservices.

In the menu `Pods`, you have the list of the deployed microservices and on which node they are. (it may have two pages of Pods)

From the Web app, click on the `New deployment` menu at the left.
This page allows selecting which IDE services will be available.
For example, deselect `definition` to remove the `Go to definition` service.
Check the root `IDE_for_NabLab` which is mandatory and click on the `Next` button.
This page displays the two nodes of the cluster and where the microservices are deployed.
The list at the left shows the candidate services to add in the node. Once selected they are added by clicking on the `>` button.
The list at the right shows the services that are inside the node. They can be removed by a selection and a click on the `<` button.
You can for example remove `rename` from `node2` and add it to `node1`.
Click on the `Next` button to go to the page that summaries your microservice deployment.
Click on the `DEPLOY` button to apply the deployment.
The change can be viewed in the Kubernetes Dashboard.

Reload the Web app (i.e., retype the URL `localhost:8081` in Firefox) and go back to the Nablab editor.
You will see that the `Go to definition` is not there anymore and that the `rename` is still working.

