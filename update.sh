#!/usr/bin/env bash

echo "Updating generated JSON..."
dhall-to-json <<< '(./dhall/content/english.dhall).me' > ./data/english.json
dhall-to-json <<< '(./dhall/content/norwegian.dhall).me' > ./data/norwegian.json
echo "Finished updating..."