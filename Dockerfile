FROM ubuntu:18.04

ENV LC_ALL=C

RUN apt-get update \
  && apt-get dist-upgrade -y \
  && apt-get install -y software-properties-common \
  && add-apt-repository ppa:ubuntu-toolchain-r/test \
  && apt-get update \
  && apt-get install -y \
    ccache \
    g++ \
    gcc \
    git \
    openjdk-8-jre-headless \
    curl \
    python-pip \
    python3-pip \
    python-all \
    libfontconfig1 \
    make \
    gcc-6-multilib \
    g++-6-multilib \
    qemu qemu-user-static

RUN git clone https://github.com/rvagg/rpi-newer-crosstools.git /opt/raspberrypi/rpi-newer-crosstools

COPY cc-selector.sh /opt/raspberrypi/cc-selector.sh

RUN chmod 755 /opt/raspberrypi/cc-selector.sh

ENV SHELL=/bin/bash \
  PATH=/usr/lib/ccache/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
  OSTYPE=linux-gnu \
  OSVARIANT=docker \
  DESTCPU=x64 \
  ARCH=x64

COPY entrypoint.sh /entrypoint.sh
WORKDIR /node

ENTRYPOINT ["/entrypoint.sh"]
