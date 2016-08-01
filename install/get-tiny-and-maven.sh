#!/bin/bash

set -e

export TINI_VERSION=0.9.0

# curl -O -L https://github.com/krallin/tini/releases/download/v0.9.0/tini_0.9.0.rpm
curl -O -L "https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini_${TINI_VERSION}.rpm"
mv "tini_${TINI_VERSION}.rpm" tini-rpm/
curl -L -O http://mirror.nbtelecom.com.br/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
mv apache-maven-3.3.9-bin.tar.gz maven3/
