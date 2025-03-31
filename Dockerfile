# You will need to bind the container's /pki directory somewhere to make any
# practial use of this container as this is where EasyRSA will place it's
# files, including certificates, signing requests, and private keys.
#
# You should take care to restrict access to these files, for what should be
# obvious reasons. Fail to do so at your own risk.

LABEL org.opencontainers.image.source="https://github.com/draeath/easyrsa-docker.git"
LABEL org.opencontainers.image.version="3.2.2"
LABEL org.opencontainers.image.upstream.source="https://github.com/OpenVPN/easy-rsa.git"
LABEL org.opencontainers.image.upstream.revision="8de63429e6c70e4c573aad291fb0ca3cdba763bd"

FROM registry.access.redhat.com/ubi9/ubi
RUN dnf makecache &&\
    dnf upgrade -y &&\
    dnf install -y --allowerasing openssl &&\
    dnf clean all

# directory inside the repository that contains the easyrsa script
ARG scriptdir="easyrsa3"

# name of the easyrsa script itself
ARG scriptname="easyrsa"

ENV PATH="/easy-rsa/${scriptdir}:${PATH}"
ENV EASYRSA_PKI="/pki/ca"

# symlink /pki -> /opt/pki to make -v argument sorter, for convenience
RUN mkdir -pv /pki
ADD easy-rsa /easy-rsa

VOLUME /pki
WORKDIR /easy-rsa
ENTRYPOINT ["easyrsa"]
CMD ["help"]
