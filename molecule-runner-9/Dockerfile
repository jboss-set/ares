FROM registry.access.redhat.com/ubi9/ubi-init
VOLUME ["/etc/pki"]
ADD redhat.repo /etc/yum.repos.d/
ADD RPM-GPG-KEY-EPEL-9 /etc/pki/rpm-gpg/
RUN dnf install -y ansible-core gcc python3-pip python3-devel python3-lxml libxml2-devel \
                   libxslt-devel openssl-devel python3-libselinux vim-enhanced git ncurses \
                   ansible-lint jq procps-ng sudo && dnf clean all && dnf update -y
RUN groupadd -g 1000 jenkins && \
    groupadd sudo && \
    useradd -ms /bin/bash -d /var/jenkins_home/ -u 1000 -g jenkins jenkins && \
    usermod -aG sudo jenkins && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN pip-3.9 install molecule molecule-docker molecule-podman && \
    pip-3.9 install --upgrade pip setuptools
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]
