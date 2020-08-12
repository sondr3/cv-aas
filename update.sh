#!/usr/bin/env bash

echo "Updating generated JSON..."
dhall-to-json <<< '(./english.dhall).me' > english.json
dhall-to-json <<< '(./norwegian.dhall).me' > norwegian.json
echo "Finished updating..."