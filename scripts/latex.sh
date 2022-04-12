#!/usr/bin/env bash

echo "Rendering to PDF"
cd ./data || exit
lualatex -pdf -interaction=nonstopmode english.tex
lualatex -pdf -interaction=nonstopmode norwegian.tex
echo "Finished rendering"

echo "Creating properly named CVs"
cp norwegian.pdf SondreAasemoenCV.pdf
cp english.pdf SondreAasemoenCV-English.pdf

echo "Finished updating..."
