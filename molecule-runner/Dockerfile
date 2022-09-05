FROM registry.access.redhat.com/ubi8/ubi
VOLUME ["/etc/pki"]
ADD redhat.repo /etc/yum.repos.d/
RUN dnf install -y systemd; dnf clean all; (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); rm -f /lib/systemd/system/multi-user.target.wants/*; rm -f /etc/systemd/system/*.wants/*; rm -f /lib/systemd/system/local-fs.target.wants/*; rm -f /lib/systemd/system/sockets.target.wants/*udev*; rm -f /lib/systemd/system/sockets.target.wants/*initctl*; rm -f /lib/systemd/system/basic.target.wants/*; rm -f /lib/systemd/system/anaconda.target.wants/*;
RUN groupadd -g 1000 jenkins
RUN useradd -ms /bin/bash -d /var/jenkins_home/ -u 1000 -g jenkins jenkins
RUN dnf install -y ansible-core gcc python3-pip python3-devel openssl-devel python3-libselinux vim-enhanced git ncurses ansible-lint jq procps-ng && dnf clean all
RUN pip-3.8 install "molecule[docker,podman,lint]"
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]