FROM debian:sid-slim
MAINTAINER Wes Widner <kai5263499@gmail.com>

# Install pulseaudio and pocketsphinx
RUN apt-get update && apt-get install -y \
    sphinxbase-utils libsphinxbase-dev libsphinxbase3 sphinx-common \
    --no-install-recommends

WORKDIR /data

VOLUME /data