# easyrsa-docker
docker/podman container build for OpenVPN's easyrsa

Usage is pretty simple, just run the container (as an entrypoint has been set) with some external directory bound to /pki inside the container (`-v` argument). For example:

    podman run -it --rm -v ~/.easyrsa:/pki draeath/easyrsa:latest init-pki soft

If you need to use a different easyrsa version, just checkout a different reference in the easyrsa git submodule.
