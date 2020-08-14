FROM rust:1-stretch

WORKDIR /usr/src/cv
COPY . .

RUN cargo install --path .

CMD ["cv-aas"]