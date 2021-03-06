#!/bin/bash
set -e
CWD=`pwd`
rm -fr /tmp/build_gevent_deb
set -x
mkdir /tmp/build_gevent_deb
util/makedist.py --dest /tmp/build_gevent_deb/gevent.tar.gz --version dev
cd /tmp/build_gevent_deb
tar -xf gevent.tar.gz
fpm -s python -t deb gevent*/setup.py
mkdir -p $CWD/build
mv *.deb $CWD/build/
