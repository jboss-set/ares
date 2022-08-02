FROM registry.access.redhat.com/ubi8/ubi-init
VOLUME ["/etc/pki"]
ADD redhat.repo /etc/yum.repos.d/
RUN dnf install -y ansible-core gcc python3-pip python3-devel openssl-devel python3-libselinux vim-enhanced git ncurses ansible-lint jq
RUN pip-3.8 install "molecule[docker,podman,lint]"
RUN groupadd -g 1000 jenkins
RUN useradd -ms /bin/bash -d /var/jenkins_home/ -u 1000 -g jenkins jenkins
