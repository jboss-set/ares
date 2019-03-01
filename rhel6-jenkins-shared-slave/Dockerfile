#
# This docker image is a multi-purpose RHEL 6.8 image design to run most (if not all) the JBoss SET jobs
# on our integration server Thunder: https://thunder.sin2.redhat.com/jenkins/.
#
# Note that to be fully functional, this image needs to be run with the following mounts:
#   /usr/share/javazi-1.8/:/usr/share/javazi-1.8/:ro
#   /opt/:/opt/:ro
#   /home/jboss/.ssh:/home/jboss/.ssh:ro
#   /home/jboss/.gitconfig:/home/jboss/.gitconfig:ro
#   /home/jboss/pull-request-processor/:/home/jboss/pull-request-processor/:ro
#   /home/jboss/.m2:/home/jboss/.m2:rw
#   /home/jboss/jenkins_workspace:/home/jboss/jenkins_workspace:rw

FROM registry.access.redhat.com/rhel6.8
MAINTAINER Romain Pelisse "belaran@redhat.com"

ADD repos/rhel68.repo /etc/yum.repos.d/rhel68.repo
ADD repos/epel-release-latest-6.noarch.rpm /root/
RUN yum -y install /root/epel-release-latest-6.noarch.rpm 

RUN mkdir -p /var/run/sshd
RUN yum -y update
ADD sshd/sshd_config /etc/ssh/
ADD sshd/ssh_host_dsa_key /etc/ssh/
ADD sshd/ssh_host_dsa_key.pub /etc/ssh/
ADD sshd/ssh_host_key /etc/ssh/
ADD sshd/ssh_host_key.pub /etc/ssh/
ADD sshd/ssh_host_rsa_key /etc/ssh/
ADD sshd/ssh_host_rsa_key.pub /etc/ssh/
RUN yum -y install openssh-server java-1.8.0-openjdk-devel git which wget zip unzip svn bats patch perl-XML-XPath

RUN echo "root:password" | chpasswd
RUN groupadd -g 498 jboss
RUN useradd -u 498 -g 498 jboss
RUN echo "jboss:jboss" | chpasswd

RUN mkdir -p  /home/jenkins-build
RUN chown -R jboss:jboss  /home/jenkins-build

RUN sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd

RUN mkdir -p /var/run/supervisord
ADD supervisord.conf /etc/supervisord.conf

ADD 90-nproc.conf /etc/security/limits.d/90-nproc.conf

ADD container-startup.sh /usr/bin/container-startup.sh
RUN chmod +x /usr/bin/container-startup.sh

EXPOSE 22
CMD ["/sbin/service","sshd", "start"]
CMD ["/usr/bin/container-startup.sh"]
