# You will need to bind the container's /pki directory somewhere to make any
# practial use of this container as this is where EasyRSA will place it's
# files, including certificates, signing requests, and private keys.
#
# You should take care to restrict access to these files, for what should be
# obvious reasons. Fail to do so at your own risk.

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

ENTRYPOINT ["easyrsa"]
CMD ["help"]
