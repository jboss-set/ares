FROM quay.io/ansible/toolset
RUN apt-get update
RUN apt-get -y install ssh
RUN groupadd -g 1000 jenkins
RUN useradd -ms /bin/bash -d /var/jenkins_home/ -u 1000 -g jenkins jenkins
