FROM registry.access.redhat.com/ubi8/ubi:latest
RUN yum install -y unzip zip rsync git procps-ng net-tools iputils glibc-langpack-en
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'
RUN groupadd -g 1000 jenkins
RUN useradd -ms /bin/bash -d /var/jenkins_home/ -u 1000 -g jenkins jenkins
