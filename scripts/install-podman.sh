#!/usr/bin/env bash
#
#  ███    ███ ██████
#  ████  ████ ██   ██
#  ██ ████ ██ ██████
#  ██  ██  ██ ██
#  ██      ██ ██
#
#
# Author: Madalin Popa
# Version: 0.1.0
# Email: github@madalinpopa.com

cd ~
sudo apt install \
  btrfs-progs \
  git \
  golang-go \
  go-md2man \
  iptables \
  libassuan-dev \
  libbtrfs-dev \
  libc6-dev \
  libdevmapper-dev \
  libglib2.0-dev \
  libgpgme-dev \
  libgpg-error-dev \
  libprotobuf-dev \
  libprotobuf-c-dev \
  libseccomp-dev \
  libselinux1-dev \
  libsystemd-dev \
  pkg-config \
  runc \
  uidmap
sudo apt install slirp4netns
curl -v https://github.com/containers/podman/archive/refs/tags/v4.2.1.tar.gz
tar -xzf v4.2.1.tar.gz
