# Cobbled together from
# https://github.com/nieleyde/rpi-nodered/blob/master/Dockerfile
# but fetching and compiling node directly.

FROM resin/rpi-raspbian

# install required packages, in one command
RUN apt-get update

RUN apt-get install -y make gcc g++ python wget make ca-certificates
ENV PYTHON /usr/bin/python2

RUN wget https://nodejs.org/dist/v4.3.1/node-v4.3.1-linux-armv7l.tar.xz && \
    cd /usr/local && \
    sudo tar xvf ~/node-v4.3.1-linux-armv7l.tar.xz --strip=1 && \
    cd node-v4.3.1-linux-armv7l && \
    rm ~/node-v4.3.1-linux-armv7l.tar.xz && \
    cd
