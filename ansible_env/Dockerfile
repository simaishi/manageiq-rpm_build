FROM registry.access.redhat.com/ubi8/ubi:8.2

ARG ARCH=x86_64

ENV NAME=manageiq-ansible-venv \
    VERSION=1.0.0 \
    VENV_PATH=/var/lib/manageiq

RUN dnf -y --disableplugin=subscription-manager install \
      http://mirror.centos.org/centos/8.2.2004/BaseOS/${ARCH}/os/Packages/centos-repos-8.2-2.2004.0.1.el8.${ARCH}.rpm \
      http://mirror.centos.org/centos/8.2.2004/BaseOS/${ARCH}/os/Packages/centos-gpg-keys-8.2-2.2004.0.1.el8.noarch.rpm \
      https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm && \
    dnf -y --disableplugin=subscription-manager --setopt=tsflags=nodocs install \
      copr-cli \
      gcc \
      libcurl-devel \
      libxml2-devel \
      openssl-devel \
      python3-devel \
      python3-virtualenv \
      rpm-build

COPY requirements.txt $VENV_PATH/
COPY $NAME.spec build.sh /

CMD ["/build.sh"]
