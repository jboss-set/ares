ARG jenkins_version=2.452.3-lts
FROM jenkins/jenkins:$jenkins_version
ARG jenkins_version:
ARG java_home=/opt/java/openjdk/

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false -Dhudson.model.DirectoryBrowserSupport.CSP='unsafe-inline'
# The /casc.yaml file is to be mounted when starting the container:
ENV CASC_JENKINS_CONFIG /casc.yaml
COPY set-plugins-list.txt $jenkins_home/set-plugins-list.txt
COPY scriptApproval.xml $jenkins_home/scriptApproval.xml
COPY cacerts $jenkins_home/cacerts
RUN jenkins-plugin-cli -f $jenkins_home/set-plugins-list.txt
USER root
RUN keytool -importkeystore -srckeystore $jenkins_home/cacerts -destkeystore $java_home/lib/security/cacerts -srcstorepass changeit -deststorepass changeit
USER jenkins
