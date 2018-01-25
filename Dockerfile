FROM ubuntu:14.04

MAINTAINER Dan Lynch <pyramation@gmail.com>

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install build-essential libssl-dev libdb++-dev libboost-all-dev libminiupnpc-dev libqrencode-dev
RUN apt-get -y install git

RUN git clone https://github.com/carsenk/denarius

RUN cd denarius/src \
 && make -f makefile.unix

ADD mount/dotfiles /root
ADD mount/etc /etc
