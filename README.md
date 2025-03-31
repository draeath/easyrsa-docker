# easyrsa-docker
docker/podman container build for OpenVPN's easyrsa

Usage is pretty simple, just run the container (as an entrypoint has been set) with a volume or some external directory bound to /pki inside the container (`-v` argument). For example:

    podman run -it --rm -v easyrsa:/pki:rw,z docker.io/draeath/easyrsa:latest init-pki soft

If you need to use a different easyrsa version, just checkout a different reference in the easy-rsa git submodule.
