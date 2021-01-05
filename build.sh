#!/usr/bin/env bash
set -x
set -e
CIDFILE=$(mktemp /tmp/build-container.XXXXXXXXX)
IIDFILE=$(mktemp /tmp/image-id.XXXXXXXXX)
[[ -e $CIDFILE ]] && rm $CIDFILE

docker build --iidfile $IIDFILE .
docker run --cidfile $CIDFILE  -e PACKAGE=$1 $(cat $IIDFILE) /usr/bin/build-package
docker cp $(cat $CIDFILE):/tmp/all-packages.tar .
[[ -e $CIDFILE ]] && rm $CIDFILE
#[[ -e $IIDFILE ]] && rm $IIDFILE
