#!/bin/bash


# Toolchain to run from the container
TOOLCHAIN=stable-aarch64-unknown-linux-gnu
# target for the toolchain
TARGET=armv7-unknown-linux-gnueabihf

# Docker image in which to run the compilation
# First build from the cross repo with ./build-docker-image.sh armv7-unknown-linux-gnueabihf
IMAGE=spotifyd-cross:armv7-unknown-linux-gnueabihf

rustup toolchain add $TOOLCHAIN
rustup target add --toolchain $TOOLCHAIN $TARGET

CARGO_CMD='PATH=$PATH:/rust/bin cargo build --target '$TARGET' --release'

docker run --userns host -e PKG_CONFIG_ALLOW_CROSS=1 --rm --user 501:20 -e XARGO_HOME=/xargo -e CARGO_HOME=/cargo -e CARGO_TARGET_DIR=/target -e USER=fons -e CROSS_RUNNER= -v /Users/fons/.xargo:/xargo:Z -v /Users/fons/.cargo:/cargo:Z -v /cargo/bin -v /Users/fons/spotifyd:/project:Z -v /Users/fons/.rustup/toolchains/$TOOLCHAIN:/rust:Z,ro -v /Users/fons/spotifyd/target:/target:Z -w /project -i -t $IMAGE sh -c "$CARGO_CMD"
