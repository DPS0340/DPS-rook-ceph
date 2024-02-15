#!/bin/sh

# Enable debug output
PS4="\n\033[1;33m>>\033[0m "; set -x

LOCATION=$(realpath "$0")
DIR=$(dirname "$LOCATION")

sudo -v

helm repo add rook https://charts.rook.io/release

helm upgrade --install --create-namespace -n rook-ceph rook-ceph ./rook-ceph -f ./rook-ceph/values.yaml --version 1.13.4 --wait
helm upgrade --install --create-namespace -n rook-ceph rook-ceph-cluster ./rook-ceph-cluster -f ./rook-ceph/values.yaml -f ./rook-ceph-cluster/values-override.yaml --version 1.13.4 --wait
