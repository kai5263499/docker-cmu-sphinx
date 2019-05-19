FROM jrottenberg/ffmpeg:3.3-alpine AS ffmpeg
FROM debian:sid-slim
LABEL MAINTAINER="Wes Widner <kai5263499@gmail.com>"

# Install pulseaudio and pocketsphinx
RUN apt-get update && apt-get install -y \
	alsa-utils \
	libasound2 \
	libasound2-plugins \
	pulseaudio \
	pulseaudio-utils \
    libportmidi0 libportmidi-dev \
    ca-certificates \
    pocketsphinx libpocketsphinx-dev sphinxbase-utils libsphinxbase-dev libsphinxbase3 sphinx-common \
    curl portaudio19-dev \
    sox \
    --no-install-recommends

COPY --from=ffmpeg /usr/local /usr/local/
COPY default.pa /etc/pulse/default.pa
COPY client.conf /etc/pulse/client.conf
COPY daemon.conf /etc/pulse/daemon.conf

ENV HOME /home/pulseaudio
RUN useradd --create-home --home-dir $HOME pulseaudio \
	&& usermod -aG audio,pulse,pulse-access pulseaudio \
	&& chown -R pulseaudio:pulseaudio $HOME

WORKDIR /data

VOLUME /data
