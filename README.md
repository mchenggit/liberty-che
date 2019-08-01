# liberty-che
Demo of open liberty on che

## Introduction

This project contains a a demo Eclipse Che stack that can be used for maven projects that the Liberty plugin. It can be used in Openshift Codeready workspaces. It is based on a pre-existing Openshift stack that contains JDK 8 and Maven 3.5.x.  The new stack updates the Maven version to 3.6.1, which is required for liberty maven plugin.

## Prerequistes

You have installed codeready workspace in your minishift/openshift cluster. See: https://developers.redhat.com/products/codeready-workspaces/overview

## Building the stack image

To build the new images, just run build.sh.  This creates a local image called `open-liberty-che`.

## Pushing the stack image

This image should be pushed into a minishift/openshift/OKD internal registry. To do this:
- Login to the internal registry. For example, `docker login -u <uid> -p $(oc whoami -t) docker-registry-default.sires1.fyre.ibm.com `
- Tag the open-liberty-che image for the destination cluster: `docker tag open-liberty-che docker-registry-default.sires1.fyre.ibm.com/openshift/open-liberty-che`
- Push the image to the destination registry: `docker push docker-registry-default.sires1.fyre.ibm.com` 

## Create a new open-liberty-che stack

To create a new stack:
- Login to your codeready workspace
- 


  "org.eclipse.che.exec",
              "org.eclipse.che.terminal",
              "org.eclipse.che.ws-agent"