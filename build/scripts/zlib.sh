#!/bin/bash
set -e -u
ARCHIVE=zlib-1.2.7.tar.gz
ARCHIVEDIR=zlib-1.2.7
. $KOBO_SCRIPT_DIR/build-common.sh

pushd $ARCHIVEDIR
	CHOST=${CROSSTARGET} CROSS_PREFIX=${CROSSTARGET} ./configure --prefix=${DEVICEROOT}
	$MAKE -j$MAKE_JOBS
	$MAKE  install
popd
markbuilt
