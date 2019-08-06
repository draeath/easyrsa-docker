#!/bin/bash

# see Dockerfile for available build args, if you want a different version of easyrsa.

runtime() {
  if hash docker 2>/dev/null; then
    docker "$@"
  elif hash podman 2>/dev/null; then
    podman "$@"
  else
    echo "You need docker or podman!" >&2
    exit 1
  fi
}

runtime build -t "draeath/easyrsa:latest" .
