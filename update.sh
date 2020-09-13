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

echo "Rendering to PDF"
cd ./data
lualatex -pdf -interaction=nonstopmode english.tex
lualatex -pdf -interaction=nonstopmode norwegian.tex
echo "Finished rendering"

echo "Creating properly named CVs"
cp norwegian.pdf SondreNilsenCV.pdf
cp english.pdf SondreNilsenCV-en.pdf

echo "Finished updating..."
