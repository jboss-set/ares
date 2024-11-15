FROM registry.access.redhat.com/ubi9/ubi-init
VOLUME ["/etc/pki"]
ARG ansible_version=2.16
ADD redhat.repo /etc/yum.repos.d/
ADD RPM-GPG-KEY-EPEL-9 /etc/pki/rpm-gpg/
RUN groupadd -g 1000 jenkins && \
    groupadd sudo && \
    useradd -ms /bin/bash -d /var/jenkins_home/ -u 1000 -g jenkins jenkins && \
    usermod -aG sudo jenkins && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN dnf install -y python3-virtualenv rsync zip vim-enhanced git ncurses jq && dnf clean all && dnf update -y
RUN source /virtualenv/$ansible_version/bin/activate && pip install ansible-core==$ansible_version
RUN curl -L https://github.com/jgm/pandoc/releases/download/3.2/pandoc-3.2-linux-amd64.tar.gz -o pandoc-3.2-linux-amd64.tar.gz && \
    tar xvzf pandoc-3.2-linux-amd64.tar.gz --strip-components 1 -C /usr && \
    rm pandoc-3.2-linux-amd64.tar.gz
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]
