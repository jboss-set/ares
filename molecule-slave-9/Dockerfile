FROM registry.access.redhat.com/ubi9/ubi-init
VOLUME ["/etc/pki"]
ADD redhat.repo /etc/yum.repos.d/
ADD RPM-GPG-KEY-EPEL-9 /etc/pki/rpm-gpg/
RUN groupadd -g 1000 jenkins && \
    groupadd sudo && \
    useradd -ms /bin/bash -d /var/jenkins_home/ -u 1000 -g jenkins jenkins && \
    usermod -aG sudo jenkins && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN dnf install -y ansible-core vim-enhanced git ncurses procps-ng openssh-server && dnf clean all
RUN systemctl enable sshd
RUN mkdir -p /root/.ssh/
COPY id_rsa.pub /root/.ssh/authorized_keys
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]
