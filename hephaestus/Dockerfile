FROM jenkins/jenkins:2.346.3-2-lts
ARG jenkins_home=/var/jenkins_home
ARG java_home=/opt/java/openjdk/

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV JENKINS_ARGS="--prefix=/jenkins"
ENV JENKINS_OPTS="--prefix=/jenkins"
ENV CASC_JENKINS_CONFIG /casc.yaml
COPY set-plugins-list.txt $jenkins_home/set-plugins-list.txt
COPY cacerts $jenkins_home/cacerts
RUN /usr/local/bin/install-plugins.sh < $jenkins_home/set-plugins-list.txt
USER root
RUN keytool -importkeystore -srckeystore $jenkins_home/cacerts -destkeystore $java_home/lib/security/cacerts -srcstorepass changeit -deststorepass changeit
USER jenkins
COPY casc.yaml /casc.yaml
