# Cobbled together from
# https://github.com/nieleyde/rpi-nodered/blob/master/Dockerfile
# but fetching and compiling node directly.

FROM resin/rpi-raspbian

# install required packages, in one command
RUN apt-get update

RUN apt-get apt-utils

RUN apt-get install -y make gcc g++ python wget make ca-certificates
ENV PYTHON /usr/bin/python2

RUN mkdir /nodetemp && \
    cd /nodetemp && \
    wget https://nodejs.org/dist/v4.3.1/node-v4.3.1-linux-armv7l.tar.xz && \
    cd /usr/local && \
    sudo tar xvf /nodetemp/node-v4.3.1-linux-armv7l.tar.xz --strip=1 && \
    rm -rf /nodetemp && \
    cd
