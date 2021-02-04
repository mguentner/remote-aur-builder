#!/usr/bin/env bash
set -x
set -e
CIDFILE=$(mktemp /tmp/build-container.XXXXXXXXX)
IIDFILE=$(mktemp /tmp/image-id.XXXXXXXXX)
[[ -e $CIDFILE ]] && rm $CIDFILE

podman build --iidfile $IIDFILE .
podman run --cidfile $CIDFILE  -e PACKAGES=$1 $(cat $IIDFILE) /usr/bin/build-package
podman cp $(cat $CIDFILE):/tmp/all-packages.tar .
[[ -e $CIDFILE ]] && rm $CIDFILE
[[ -e $IIDFILE ]] && rm $IIDFILE
