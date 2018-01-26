# You will need to bind the container's /pki directory somewhere to make any
# practial use of this container as this is where EasyRSA will place it's
# files, including certificates, signing requests, and private keys.
#
# You should take care to restrict access to these files, for what should be
# obvious reasons. Fail to do so at your own risk.

FROM alpine:latest

ARG repo="https://github.com/OpenVPN/easy-rsa.git"
ARG checkout="tags/v3.0.4"

# directory inside the repository that contains the easyrsa script
ARG scriptdir="easyrsa3"

# name of the easyrsa script itself
ARG scriptname="easyrsa"

USER root
WORKDIR /root

RUN apk --no-cache add git openssl
RUN git config --global pack.compression 9 \
 && git config --global core.compression 9 \
 && git config --global core.looseCompression 9
RUN git clone --no-checkout ${repo} /easyrsa
RUN git -C /easyrsa checkout ${checkout}

ENV PATH="/easyrsa/${scriptdir}:${PATH}"

# https://github.com/OpenVPN/easy-rsa/blob/v3.0.4/easyrsa3/easyrsa#L1037-L1038
# https://github.com/OpenVPN/easy-rsa/issues/178
RUN mkdir -pv "/pki"
ENV EASYRSA_PKI="/pki/easyrsa-ca"

ENTRYPOINT ["easyrsa"]
CMD ["help"]
