FROM alpine:3

ARG path="target/release/cv-aas"

WORKDIR /usr/src/cv

COPY $path cv-aas

COPY static static

RUN chmod +x cv-aas

CMD ["./cv-aas"]