FROM debian:sid-slim
MAINTAINER Wes Widner <kai5263499@gmail.com>

# Install pulseaudio
RUN apt-get update && apt-get install -y \
	alsa-utils \
	libasound2 \
	libasound2-plugins \
	pulseaudio \
	pulseaudio-utils \
    libportmidi0 libportmidi-dev \
    ca-certificates \
    pocketsphinx libpocketsphinx-dev sphinxbase-utils libsphinxbase-dev libsphinxbase3 sphinx-common \
    curl pkg-config portaudio19-dev gcc automake autoconf libtool git make direnv \
    --no-install-recommends

COPY default.pa /etc/pulse/default.pa
COPY client.conf /etc/pulse/client.conf
COPY daemon.conf /etc/pulse/daemon.conf

ENV HOME /home/pulseaudio
RUN useradd --create-home --home-dir $HOME pulseaudio \
	&& usermod -aG audio,pulse,pulse-access pulseaudio \
	&& chown -R pulseaudio:pulseaudio $HOME

WORKDIR /go

ENV GOPATH /go
ENV PATH /usr/local/go/bin:$GOPATH/bin:/go/bin:$PATH
ENV GO_VERSION 1.12.5

# Install go
RUN curl -sSL https://dl.google.com/go/go$GO_VERSION.linux-amd64.tar.gz -o /tmp/go.tar.gz && \
    tar -C /usr/local/ -vxzf /tmp/go.tar.gz && \
    echo 'eval "$(direnv hook bash)"' >> ~/.bashrc && \
    echo "layout go" > /go/.envrc && \
    cd /go && direnv allow

# Install go packages
RUN go get -u github.com/golang/dep/cmd/dep && \
    go get github.com/xlab/pocketsphinx-go/sphinx && \
    go get github.com/xlab/portaudio-go/portaudio && \
    go get github.com/gordonklaus/portaudio && \
    go get github.com/jawher/mow.cli && \
    go get github.com/xlab/closer
