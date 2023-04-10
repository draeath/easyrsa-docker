#!/bin/bash

# see Dockerfile for available build args, if you want a different version of easyrsa.

runtime() {
  if hash podman 2>/dev/null; then
    podman "$@"
  elif hash docker 2>/dev/null; then
  docker "$@"
  else
    echo "You need docker or podman!" >&2
    exit 1
  fi
}

runtime build -t "easyrsa:latest" .
