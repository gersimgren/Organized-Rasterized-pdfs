# Organized-Rasterized-pdfs
Done on debian
QPDF used
GHOSTSCRIPT used
IMG2PDF used
EXIFTOOL used

if you question the legitamacy of said files, i recommend you do this process yourself:

**To turn into pdf:**
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=pnggray -r150 \
   -dTextAlphaBits=4 -dGraphicsAlphaBits=4 \
  -sOutputFile='/home/debian/Downloads/Cleanpngs/page-%04d.png'  pdf.pdf

**To clean metadate if you desire (redundant if you turn into pngs)**
exiftool -all= -overwrite_original file.pdf

**To turn you pngs into pdfs**
img2pdf /path/to/images/*.png -o /path/to/output/final.pdf

**To seperate you pdfs to publish on github**
qpdf input.pdf --pages . 1-3 -- part1.pdf   # pages 1 to 3
qpdf input.pdf --pages . 4-6 -- part2.pdf   # pages 4 to 6

**To put you pdfs back together**
qpdf --empty --pages file1.pdf file2.pdf file3.pdf -- output.pdf

**Bash script is used to auto seperate pdfs**
