FROM ubuntu

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN apt-get update && \
    apt-get install -yqq software-properties-common && \
    add-apt-repository ppa:plt/racket && \
    apt-get update && \
    apt-get install -yqq racket && \
    raco pkg install --scope installation rackunit && \
    raco pkg install --scope installation sicp

WORKDIR /sicp