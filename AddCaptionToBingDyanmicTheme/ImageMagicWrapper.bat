echo %1
echo %2
C:\ImageMagick-6.7.6-9\mogrify.exe -fill white -box gray -gravity NorthEast -pointsize 20 -annotate +10+5 %1 %2
