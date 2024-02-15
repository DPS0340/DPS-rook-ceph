#!/bin/sh

# Enable debug output
PS4="\n\033[1;33m>>\033[0m "; set -x

LOCATION=$(realpath "$0")
DIR=$(dirname "$LOCATION")

sudo -v

helm repo add rook https://charts.rook.io/release

helm upgrade --install --create-namespace -n rook-ceph rook-ceph ./rook-ceph-1.13.4 -f ./rook-ceph-1.13.4/values.yaml --wait
helm upgrade --install --create-namespace -n rook-ceph rook-ceph-cluster ./rook-ceph-cluster-1.13.4 -f ./rook-ceph-cluster-1.13.4/values.yaml -f ./rook-ceph-cluster-1.13.4/values-override.yaml --wait
