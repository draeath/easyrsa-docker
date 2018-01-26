# easyrsa-docker
docker container build for OpenVPN's easyrsa

Usage is pretty simple, just run the container (as an entrypoint has been set)
with some external directory bound to /pki inside the container (`-v` argument)

If you need to use a different easyrsa version, check the ARGs defined in the
[Dockerfile](easyrsa/Dockerfile) and rebuild as you see fit.

Docker Hub: [draeath/easyrsa](https://hub.docker.com/r/draeath/easyrsa)
