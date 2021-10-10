#!/usr/bin/env bash

echo "Updating"

echo "Updating English..."
echo "Updating JSON..."
dhall-to-json <<< '(./dhall/content/english.dhall).me' > ./data/english.json
echo "Updating TeX..."
dhall text <<< '(./dhall/content/english.dhall).resume' > ./data/english.tex
echo "Finished English!"

echo "Updating Norwegian..."
echo "Updating JSON..."
dhall-to-json <<< '(./dhall/content/norwegian.dhall).me' > ./data/norwegian.json
echo "Updating TeX..."
dhall text <<< '(./dhall/content/norwegian.dhall).resume' > ./data/norwegian.tex
echo "Finished Norwegian!"