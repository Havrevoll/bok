#!/bin/bash

myfunc() {
    fil=$1
    echo $fil til ${fil%.jpg}_a.tiff og ${fil%.jpg}_b.tiff
     convert $fil -crop 2038x2909+210+11 +repage -threshold 70% -monochrome -compress Group4 ${fil%.jpg}_a.tiff
     convert $fil -crop 2038x2909+2250+11 +repage -threshold 70% -monochrome -compress Group4 ${fil%.jpg}_b.tiff
}

export -f myfunc



# jpegtran:  sudo apt install libjpeg-turbo-progs
for f in *.jpg; do jpegtran -rotate 90 $f > rot/$f;done

find . -name "*.jpg" | parallel myfunc

jbig2 -s -p -v *.tiff && python2 /usr/local/bin/pdf.py output >out.pdf

ocrmypdf --output-type pdf --author "Wolfgang Rodi" --title "Turbulence models and their application in hydraulics" out.pdf turb.pdf