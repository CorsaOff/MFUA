FROM rust:1-slim
WORKDIR /app
COPY . .
RUN cargo build --release
CMD ["./target/release/rust-app"]