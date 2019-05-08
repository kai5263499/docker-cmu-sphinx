FROM alpine

# Add english model data from https://sourceforge.net/projects/cmusphinx/files/Acoustic%20and%20Language%20Models/US%20English/
ADD https://downloads.sourceforge.net/project/cmusphinx/Acoustic%20and%20Language%20Models/US%20English/cmusphinx-en-us-8khz-5.2.tar.gz /models/
ADD https://downloads.sourceforge.net/project/cmusphinx/Acoustic%20and%20Language%20Models/US%20English/en-70k-0.1.lm.gz /models
ADD https://downloads.sourceforge.net/project/cmusphinx/Acoustic%20and%20Language%20Models/US%20English/en-70k-0.2.lm.gz /models

RUN apk update && \
    apk add git gzip unzip && \
    mkdir -p /models && \
    cd /models && \
    git clone https://github.com/cmusphinx/cmudict.git

RUN cd /models && \
    gunzip en-70k-0.1.lm.gz && \
    gunzip en-70k-0.2.lm.gz && \
    tar -zxf cmusphinx-en-us-8khz-5.2.tar.gz && \
    rm -rf *.gz

RUN apk del git gzip unzip

VOLUME [ "/models" ]