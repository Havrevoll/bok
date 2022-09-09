mutool merge -o file.pdf $(find . -maxdepth 1 -name "ebscohost*" | sort -n)
mutool clean -ggg -d -a -s file.pdf file2.pdf
qpdf file2.pdf --qdf file2.qdf
perl -pi.bak -e 's/<94[0-9a-f]{20,}>/<9405>/g' file2.qdf
fix-qdf <file2.qdf > file3.pdf
mutool clean -gggg -z file3.pdf file4.pdf
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/default -dNOPAUSE -dQUIET -dBATCH -dDetectDuplicateImages -dCompressFonts=true -r150 -sOutputFile=file5.pdf file4.pdf
