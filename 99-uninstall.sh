#!/bin/sh

# Enable debug output
PS4="\n\033[1;33m>>\033[0m "; set -x

LOCATION=$(realpath "$0")
DIR=$(dirname "$LOCATION")

sudo -v

helm repo add rook https://charts.rook.io/release

helm uninstall -n rook-ceph rook-ceph-cluster
helm uninstall -n rook-ceph rook-ceph
