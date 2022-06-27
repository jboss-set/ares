FROM fedora
RUN yum install -y ansible-core rsync git sudo
RUN groupadd -g 1000 jenkins
RUN useradd -ms /bin/bash -d /var/jenkins_home/ -u 1000 -g jenkins jenkins
