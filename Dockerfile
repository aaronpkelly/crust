FROM alpine
RUN apk update && apk add \
    rust

COPY . /app
WORKDIR /app

RUN cargo build

ENTRYPOINT ["./target/debug/crust"]