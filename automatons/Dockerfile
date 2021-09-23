FROM registry.access.redhat.com/ubi8/ubi:latest
RUN yum install -y java-1.8.0-openjdk-devel unzip zip rsync git procps-ng net-tools
RUN groupadd -g 1000 jenkins
RUN useradd -ms /bin/bash -d /var/jenkins_home/ -u 1000 -g jenkins jenkins
