# Modular and distributed IDE

## Introduction

This artifact contains the Eclipse plugins necessary to generates microservices from DSL specifications and a web application to both use theses microservices and reconfigure their deployment.

Scripts are provided to setup a local Kubernetes cluster to be used for the deployment of the microservices.

## Setup

The running environment is provided preconfigured and is available as an image for VirtualBox.
To run the image, open VirtualBox and in the menu File select Import Appliance.
Select the downloaded .ova file, click Next and Import.
At the left side, right click on the created Vm and select Start.

At the login screen, select user vagrant and set vagrant in password.

Once logged, open a terminal and type `~/git/sle2020-artifact`.
Type `./setup.sh` to install the required dependencies.
Type `mvn install` to build all the projects of the repository"
Type `cd backend` and then `./build-images.sh` to build the Docker images of the microservices used for the persistence.
Type `~/git/sle2020-artifact/frontend`, then `npm install`, and then `npx webpack` to build the web app.

## Instructions

This section describes how to generate microservices for the NabLab language, how to deploy them and and to use the web application.

### Microservices generation

Open the folder `/home/vagrant/eclipse` and double click on `eclipse` to launch Eclipse IDE.
Click on the `Launch` button.

### Import existing NabLab projects
CLick on `Import project...` link at the left side.
Select `General` > `Existing Project into Workspace` and click on `Next`.
Click on the `Browse...` button, select the folder `vagrant/git/sle2020-artifact/nablab` and click on the button `Open`.
Click the button Browse and select the directory located at Home/git/distributed-xtext-server-for-lsp/nablab/nabla.xtext.parent
Click on the button `Finish` to import the two projects defining the Nablab language in the workspace.

The files nabla.dsl is declaring the location the grammar of the NabLab language (.xtext file) and the location of the protocol file (.kaulua file).

#### Generate microservices

Do a right click on nabla.dsl and select generate FM. It will generate the project of the microservices containing the Feature Model used to validate the deployment of microservices.

Do a right click on nabla.dsl and select generate services. It will generate the projects for all the microservices.

Do a right click on nabla.dsl and select generate Script. It generate the script to build Docker images and provision them in the cluster.

### Microservices deployement

Open a terminal and type `cd ~/git/sle2020-artifact`.
Type `cd nablab-ms` and then `build-images.sh` to build the Docker images of the microservices for Nablab.

Then go back with `cd ~/git/sle2020-artifact` and type `./initCluster.sh` to launch a mini Kubernetes cluster locally and do an initial deployment of the Nablab microservices.
This command may take few minutes to complete.

Open a new tab `with Ctrl+Shift+T`.
Enter the command `./launchClusterInspector.sh`. It will launch a service used to interact with the cluster.

Open a new tab `with Ctrl+Shift+T` again.
Enter `cd frontend`.
Enter `npm run start:dev`. This command compile the webpage and makes it accessible at `localhost:8081`.

### Web application

Open Firefox and enter the URL `localhost:8081` to open the web application connected to the microservices.

#### Usage

There are two menu at the left side: `New deployment` and `Nablab editor`.
Click on `Nablab editor` to acces to the NabLab program editor.
At the right side click on the `UPLOAD` button and open the file `git/sle2020-artifact/Glace2d.nabla` to send a NabLab program in the cluster.
Do a double click on `Glace2d` to open it in the editor.

The editor is now communicating with the microservices.
For example, errors markers are computed by a dedicated microservice.
If you click on the variable `node` in the block `connectivities`, you get the positions in the program using this symbol.
By doing a right click and selecting `Rename symbol` you can rename it.
You can also go back to the variable declaration if you do a right click on a symbol and select `Go to definition`.
All theses services are provided by the deployed microservices.

#### Deployement reconfiguration

We will now change the deployment configuration of the microservices.
Click on `New deployment` menu at the left.
This page allows to select which IDE service will be available.
For example, deselect `definition`to remove the `Go to definition` service.
Check the root `IDE_for_NabLab` that is mandatory and click on the `Next` button.
This page display the two nodes of the cluster and where the microservices are deployed.
The list at the left show the candidate services to add in the node. Once selected they are addes by clicking on the `>` button.
The list at the right show the services that are inside the node. The can be removed by a selection and a click on the `<` button.
You can for example remove `rename` from `node2` and add it to `node1`.
Click on the `Next` button to go to the page that summaries your microservice deployment.
Click on the `DEPLOY` button to apply the deployement.

The change can be viewed in the Kubernetes Dashboard.
If you go back to the Nablab editor, you will see that the `Go to definition` is not there anymore and that the `rename` is still working.

