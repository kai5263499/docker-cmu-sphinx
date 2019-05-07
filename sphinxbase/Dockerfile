FROM debian:9-slim
MAINTAINER Wes Widner <kai5263499@gmail.com>

ENV LD_LIBRARY_PATH=/usr/local/lib

RUN echo "==> Updating and installing packages" && \
    apt-get update && \
    apt-get install -y build-essential gcc automake autoconf libtool git && \
    apt-get install -y swig python3-dev python3-numpy python3-scipy && \
    apt-get install -y sox bison && \
    echo "==> Installing Sphinx" && \
    mkdir -p /sphinx && \
    cd /sphinx && \
    git clone https://github.com/cmusphinx/sphinxbase.git && \
    cd /sphinx/sphinxbase && \
    ./autogen.sh && \
    ./configure --with-python && \
    make && \
    make install && \
    echo "==> Cleaning Up" && \
    rm -rf /var/lib/{apt,dpkg,cache,log} && \
    apt-get remove -y --auto-remove build-essential gcc automake autoconf libtool git && \
    apt-get clean

WORKDIR /sphinx/sphinxbase
