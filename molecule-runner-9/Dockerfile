FROM registry.access.redhat.com/ubi9/ubi-init
VOLUME ["/etc/pki"]
ARG ansible_version=2.16
ARG molecule_version=5.0.1
ADD redhat.repo /etc/yum.repos.d/
ADD RPM-GPG-KEY-EPEL-9 /etc/pki/rpm-gpg/
RUN dnf install -y gcc python3-pip python3-devel python3-lxml libxml2-devel \
                   libxslt-devel openssl-devel python3-libselinux vim-enhanced git ncurses \
                   python3-virtualenv jq procps-ng sudo && dnf clean all && dnf update -y
RUN virtualenv -p "python3" /virtualenv/$ansible_version/ && mkdir -p /virtualenv/$ansible_version
RUN source /virtualenv/$ansible_version/bin/activate && pip install ansible-core==$ansible_version molecule==$molecule_version molecule-plugins==23.4.1 molecule-podman==2.0.3 ansible-lint==6.16.2 molecule-docker==2.1.0 &&  molecule --version && ansible-galaxy collection install containers.podman
RUN groupadd -g 1000 jenkins && \
    groupadd sudo && \
    useradd -ms /bin/bash -d /var/jenkins_home/ -u 1000 -g jenkins jenkins && \
    usermod -aG sudo jenkins && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]
