FROM rust:1.42.0-buster as builder
# install cmake
RUN wget https://github.com/Kitware/CMake/releases/download/v3.15.2/cmake-3.15.2.tar.gz && \
    tar -zxvf cmake-3.15.2.tar.gz && \
    cd cmake-3.15.2 && \
    ./bootstrap && \
    make && \
    make install
# WORKDIR /usr/src/conflux
# COPY . .
WORKDIR /usr/src
RUN git clone -b v0.5.0.2  --single-branch --depth 1 https://github.com/Conflux-Chain/conflux-rust.git conflux
WORKDIR /usr/src/conflux
RUN cargo install --path .

FROM debian:buster-slim
# RUN apt-get update && apt-get install -y extra-runtime-dependencies
RUN apt-get update && apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
    apt-get install -y nodejs
WORKDIR /root
RUN mkdir run && cd run
COPY --from=builder /usr/src/conflux/run .
COPY --from=builder /usr/local/cargo/bin/conflux /usr/local/bin/conflux
COPY new_account.sh .
RUN ./new_account.sh
EXPOSE 12535 12536 12537 12538 12539 32323 32525
CMD ["conflux", "--config", "default.toml"]