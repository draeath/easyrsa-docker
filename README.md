# easyrsa-docker
docker/podman container build for OpenVPN's easyrsa

Usage is pretty simple, just run the container (as an entrypoint has been set) with some external directory bound to /pki inside the container (`-v` argument). For example:

    podman run -it --rm -v ~/.easyrsa:/pki draeath/easyrsa:latest init-pki

If you need to use a different easyrsa version, check the ARGs defined in the [Dockerfile](easyrsa/Dockerfile) and rebuild as you see fit. This should use 3.0.6 by default.

Docker Hub: [draeath/easyrsa](https://hub.docker.com/r/draeath/easyrsa)
