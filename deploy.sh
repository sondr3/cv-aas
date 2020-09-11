#!/usr/bin/env bash

echo "Redeploying CV-aaS!"

echo "Pulling origin"
git pull

echo "Getting version"
version=$(awk -F'[ ="]+' '$1 == "version" { print $2 }' Cargo.toml)

echo "Building new docker container..."
docker build --build-arg version=$version -t cv-aas .

echo "Stopping service..."
docker stop cv-aas

echo "Removing old container..."
docker container rm cv-aas

echo "Redeploying service"
docker run -itd --restart unless-stopped -p 8080:8080 --name cv-aas cv-aas

echo "And we're live again!"