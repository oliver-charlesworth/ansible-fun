FROM fedora:28

# Simulates what should be on hosts already
RUN yum install -y \
    openssh-server \
    openssh-clients \
    python \
    which \
    findutils \
    unzip \
    rsync \
    make automake gcc \
    git \
    openssl-devel libffi-devel \
    cronie

# Needed only for this experiment
RUN yum install -y \
    ansible

RUN ssh-keygen -A
RUN useradd bob

COPY keys /home/bob/.ssh

RUN \
    cd /home/bob && \
    chmod 700 .ssh && \
    cat .ssh/id_rsa.pub >> .ssh/authorized_keys && \
    chmod 600 .ssh/* && \
    chown -R bob: .ssh

CMD ["/usr/sbin/sshd", "-D"]
