#!/bin/bash

# see Dockerfile for available build args, if you want a different version of easyrsa.

docker build -t "draeath/easyrsa:latest" .
