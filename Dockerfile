FROM alpine:3

ARG path="./target/release/cv-aas"

WORKDIR /usr/src/cv

COPY $path cv-aas

CMD ["./cv-aas"]