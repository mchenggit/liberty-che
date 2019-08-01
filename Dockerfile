FROM registry.redhat.io/codeready-workspaces/stacks-java-rhel8

USER root
WORKDIR /root
RUN wget http://apache.spinellicreations.com/maven/maven-3/3.6.1/binaries/apache-maven-3.6.1-bin.tar.gz
RUN gunzip apache-maven-3.6.1-bin.tar.gz
RUN tar xvf apache-maven-3.6.1-bin.tar
RUN cp -r apache-maven-3.6.1 /usr/share
RUN alternatives --install /usr/bin/mvn mvn /usr/share/apache-maven-3.6.1/bin/mvn 120
RUN alternatives --set  mvn /usr/share/apache-maven-3.6.1/bin/mvn 

USER jboss
ENV MAVEN_VESION=3.6.1
ENV MAVEN_OPTS="-XX:MaxRAM=150m -XX:MaxRAMFraction=2 -XX:+UseParallelGC -XX:MinHeapFreeRatio=10 -XX:MaxHeapFreeRatio=20 -XX:GCTimeRatio=4 -XX:AdaptiveSizePolicyWeight=90 -Dsun.zip.disableMemoryMapping=true -Xms20m -Xmx512m -Djava.security.egd=file:/dev/./urandom"
WORKDIR /projects
