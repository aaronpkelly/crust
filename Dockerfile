FROM rust as builder
WORKDIR /usr/src/myapp
COPY . .
RUN cargo install --path .

# FROM debian:buster-slim
FROM rust:alpine
# RUN apt-get update && apt-get install -y extra-runtime-dependencies
COPY --from=builder /usr/local/cargo/bin/myapp /usr/local/bin/myapp
CMD ["crust"]