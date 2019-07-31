# Create open-liberty builder
FROM open-liberty
LABEL maintainer "Michael cheng <mcheng@us.ibm.com>"

USER root

# Install maven and open JDK for build and other utilities
RUN apt update
RUN apt -y install maven
RUN  apt-get -y install openjdk-8-jdk
RUN apt-get -y install sudo
RUN apt-get -y install vim


# Remove password, and allow sudo acccess for default user.
RUN usermod -aG sudo default
RUN passwd -d default

RUN mkdir /home/default
RUN chown default /home/default

RUN mkdir /projects
RUN chown default /projects

# Switch to default user
USER default
WORKDIR /projects
