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

ARG users="bob dev prod"
COPY keys /keys
RUN ssh-keygen -A
RUN for user in ${users}; do /keys/setup-user.sh ${user}; done && rm -rf /keys

CMD ["/usr/sbin/sshd", "-D"]
