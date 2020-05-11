FROM rust as builder
WORKDIR /usr/src/myapp
COPY . .
RUN cargo install --path .

# FROM debian:buster-slim
# FROM rust:alpine
FROM alpine
# RUN apt-get update && apt-get install -y extra-runtime-dependencies
COPY --from=builder /usr/local/cargo/bin/crust /usr/local/bin/crust
CMD ["crust"]