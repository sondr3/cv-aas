FROM debian:buster-slim

ARG version=v0.1.0

RUN apt-get update && apt-get install wget -y

WORKDIR /usr/src/cv

RUN wget https://github.com/sondr3/cv-aas/releases/download/${version}/cv-aas-x86_64-unknown-linux-musl.tar.gz

RUN tar xvf cv-aas-x86_64-unknown-linux-musl.tar.gz

CMD ["./cv-aas"]