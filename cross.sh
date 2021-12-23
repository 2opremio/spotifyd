#!/bin/sh
docker build -t spotifyd-cross:$BUILD_TARGET -f Dockerfile.$BUILD_TARGET .
cross build --target $BUILD_TARGET $@
