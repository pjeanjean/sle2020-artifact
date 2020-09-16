# Modular and distributed IDE

## Introduction

This artifact contains the Eclipse plugins necessary to generates microservices from DSL specifications and a web application to both use theses microservices and reconfigure their deployment.

Scripts are provided to setup a local Kubernetes cluster to be used for the deployment of the microservices.

## Setup

The running environment is provided preconfigured and is available as an image for VirtualBox.
To run the image, open VirtualBox and in the menu File select Import Appliance.
Select the downloaded .ova file, click Next and Import.
At the left side, right click on the created Vm and select Start.

At the login screen, select user foobar and set foobar in password.

## Instructions

This section describe how to generate microservices for the language NabLab, how to deploy them and and to use the web application.

### Microservices generation

Click on the menu Activities in the top left corner of the screen and open the file browser.
In the folder eclipse-dsl-2020-06-R-linux-gtk-x86_64, launch the binary eclipse.
At the start, Eclipse ask for a worksapce folder. Type demo-nablab.

### Import existing NabLab projects
Open the menu File and select Import -> Existing project.
Click the button Browse and select the directory located at Home/git/distributed-xtext-server-for-lsp/nablab/nabla.xtext.parent
Click on "recusive search" if is not activated.
Select the projects fr.cea.nabla and fr.cea.nabla.ide and click on the button Finish.
Theses two projects are Xtext projects definig the language NabLab.

The files nabla.dsl is declaring the location the grammar of the NabLab language (.xtext file) and the location of the protocol file (.kaulua file).

#### Generate microservices

Do a right click on nabla.dsl and select generate FM. It will generate the project of the microservices containing the Feature Model used to validate the deployment of microservices.
Do a right click on nabla.dsl and select generate services. It will generate the projects for all the microservices.

Do a right click on nabla.dsl and select generate Script. It generate the script to build Docker images and provision them in the cluster.

### Microservices deployement

Click on the menu Activities in the top left corner of the screen and select the Terminal.
Enter the command cd ~/git/distributed-xtext-server-for-lsp/
Enter the command ./initCluster.sh It will launch a local Kubernetes cluster and do an initial deployment of the microservices generated previously.

Open a new tab (with Ctrl+Shift+T).
Enter the command ./launchClusterInspector.sh. It will launch a service used to interact with the cluster.

Open a new tab (with Ctrl+Shift+T).
Enter cd frontend
Enter npm run start:dev . This command compile the webpage and makes it accessible at localhost:8081.

### Web application

#### Usage

Click on the menu Activities in the top left corner of the screen and select Firefox.
In the URL bar, type localhost:8081.

There are two menu at the left side: deployment and nablab.
Click on Nablab open a program editor.
At the right side click on the browse button and open the file Glace2d.nabla.
Do a double click on its name to open it in the editor.

The editor is now communicating with the microservices.
Content asssist is available with the Ctrl+space.
If you do a right click on a variable, you have the list of usage IDE services.

#### Deployement reconfiguration

We will now change the deployment configuration of the microservices.
Click on deployment in the left menu.

