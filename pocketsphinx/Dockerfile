FROM jrottenberg/ffmpeg:3.3-alpine AS ffmpeg
FROM kai5263499/sphinxbase:latest
LABEL MAINTAINER="Wes Widner <kai5263499@gmail.com>"

RUN echo "==> Updating and installing packages" && \
    apt-get update && \
    apt-get install -y build-essential gcc automake autoconf libtool unzip git

COPY --from=ffmpeg /usr/local /usr/local/

RUN echo "==> Installing Sphinx" && \
    mkdir -p /sphinx && \
    cd /sphinx && \
    git clone https://github.com/cmusphinx/pocketsphinx.git && \
    cd /sphinx/pocketsphinx && \
    ./autogen.sh && \
    ./configure --with-python --with-sphinxbase=/sphinx/sphinxbase && \
    make && \
    make check && \
    make install && \
    echo "==> Verifying Install" && \
    make installcheck && \
    echo "==> Cleaning Up" && \
    rm -rf /var/lib/{apt,dpkg,cache,log} && \
    apt-get remove -y --auto-remove build-essential gcc automake autoconf libtool && \
    apt-get clean

WORKDIR /data

# 'make install' installs all python modules to this dir.
# But Ubuntu recognizes only /usr/local/lib/python3.4/dist-packages
# dir by default. So add this dir to PYTHON_PATH manually.
ENV PYTHONPATH /usr/local/lib/python3.4/site-packages

VOLUME /sphinx
VOLUME /data
