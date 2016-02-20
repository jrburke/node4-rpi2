# Cobbled together from
# https://github.com/nieleyde/rpi-nodered/blob/master/Dockerfile
# but fetching and compiling node directly.

FROM resin/rpi-raspbian

# install required packages, in one command
RUN apt-get update

RUN apt-get install -y python-dev gcc-4.8 g++-4.8 wget make ca-certificates
ENV PYTHON /usr/bin/python2
ENV CXX /usr/bin/g++-4.8
ENV CC /usr/bin/gcc-4.8

RUN wget https://nodejs.org/dist/v4.3.1/node-v4.3.1.tar.gz && \
    tar xzf node-v4.3.1.tar.gz && \
    cd node-v4.3.1 && \
    ./configure && make && \
    sudo make install && \
    cd .. && \
    rm -rf node-v4.3.1
