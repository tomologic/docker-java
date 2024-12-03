#!/bin/bash
set -e

VERSION="$(git rev-parse --short HEAD)"
docker build --platform=linux/amd64 --progress=plain -t "tomologic/java:$VERSION" .
for dir in ./*/; do
    if [[ -f "${dir}Dockerfile" ]]; then
        dirname=$(basename "$dir")
        echo "Processing directory: $dirname"
        cd "$dirname"
        docker build --platform=linux/amd64 --progress=plain -t "tomologic/java:$VERSION-$dirname" \
            --build-arg BASE_IMAGE="tomologic/java:$VERSION" .
        cd ..
    fi
done

