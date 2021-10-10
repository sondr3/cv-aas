#!/usr/bin/env bash

echo "Redeploying CV-aaS!"

echo "Getting latest Docker container"
docker pull ghcr.io/sondr3/cv-aas:latest

echo "Stopping service..."
docker stop cv-aas

echo "Removing old container..."
docker container rm cv-aas

echo "Redeploying service"
docker run -itd --pull always --restart unless-stopped -p 8080:8080 --name cv-aas ghcr.io/sondr3/cv-aas:latest

echo "And we're live again!"