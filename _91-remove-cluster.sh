#!/bin/sh

# Enable debug output
PS4="\n\033[1;33m>>\033[0m "; set -x

LOCATION=$(realpath "$0")
DIR=$(dirname "$LOCATION")

sudo -v

kubectl -n rook-ceph delete cephblockpool --all --wait
kubectl -n rook-ceph delete cephfilesystem --all --wait
kubectl -n rook-ceph delete cephfilesystemsubvolumegroup --all --wait
kubectl -n rook-ceph delete cephobjectstore --all --wait

kubectl -n rook-ceph patch cephcluster rook-ceph --type merge -p '{"spec":{"cleanupPolicy":{"confirmation":"yes-really-destroy-data"}}}'
kubectl -n rook-ceph delete cephcluster rook-ceph --wait
