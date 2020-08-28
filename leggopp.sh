for f in kilden*; do composite -compose plus $f fjern.png a$f; done

for f in akilden*; do mogrify -brightness-contrast -60x70 $f; done

for fil in verset*; do composite -compose Multiply $fil ha.png ha.png; done
for fil in verset*; do mogrify -crop 1144x1574+158+423 +repage $fil; done


convert text_scan.png \( +clone -blur 0x20 \) -compose Divide_Src -composite  text_scan_divide.png