#!/bin/bash

# original=$1

# base=$(original%.pdf)

base=$1


# kanskje må dei roterast? Og delast i to, om dei er skanna?
#  for f in ein*.jpg; do jpegtran -rotate 90 -outfile r$f $f; done
#  jbig2 -s -p -v re*.jpg && ~/jbig2enc/pdf.py output >out.pdf
# ocrmypdf --output-type pdf out.pdf out2.pdf


# parallel 'convert {} -crop 1440x1482+0+575 +repage -brightness-contrast -10x10 -threshold 80% -monochrome -compress Group4 {.}.tiff' ::: *.png

for fil in $base*.png; do

tal=${fil//[!0-9]/}
tal=${tal#0}
tal=${tal#0}

echo Tek seg av $fil 
if (( $tal %2)); then
echo convert $fil -crop 1333x1970+85+245 +repage -rotate -0.85 -brightness-contrast -10x30 -threshold 70% -flatten -monochrome -trim -compress Group4 ${fil%.png}.tiff
convert $fil -crop 1333x1970+85+245 +repage -rotate -0.85 -brightness-contrast -10x30 -threshold 70% -flatten -monochrome -trim -compress Group4 ${fil%.png}.tiff
else
echo convert $fil -crop 1253x1970+100+245 +repage -rotate 0.85  -brightness-contrast -10x30 -threshold 70% -flatten -monochrome -trim -compress Group4 ${fil%.png}.tiff
convert $fil -crop 1253x1970+100+245 +repage -rotate 0.85  -brightness-contrast -10x30 -threshold 70% -flatten -monochrome -trim -compress Group4 ${fil%.png}.tiff
fi


done

echo tiffcp -c g4 $(find -name "$base*.tiff" | sort -n) $base.tiff
tiffcp -c g4 $(find -name "$base*.tiff" | sort -n) $base.tiff

echo tiff2pdf -o "$base.pdf" $base.tiff
tiff2pdf -o "$base.pdf" $base.tiff
