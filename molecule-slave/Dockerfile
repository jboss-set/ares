FROM registry.access.redhat.com/ubi8/ubi
VOLUME ["/etc/pki"]
ADD redhat.repo /etc/yum.repos.d/
RUN dnf install -y ansible vim-enhanced git ncurses
RUN dnf install -y systemd; dnf clean all; (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); rm -f /lib/systemd/system/multi-user.target.wants/*; rm -f /etc/systemd/system/*.wants/*; rm -f /lib/systemd/system/local-fs.target.wants/*; rm -f /lib/systemd/system/sockets.target.wants/*udev*; rm -f /lib/systemd/system/sockets.target.wants/*initctl*; rm -f /lib/systemd/system/basic.target.wants/*; rm -f /lib/systemd/system/anaconda.target.wants/*;
RUN dnf install -y openssh-server
RUN systemctl enable sshd
RUN mkdir /root/.ssh/
COPY id_rsa.pub /root/.ssh/authorized_keys
RUN groupadd -g 1000 jenkins
RUN useradd -ms /bin/bash -d /var/jenkins_home/ -u 1000 -g jenkins jenkins
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]
