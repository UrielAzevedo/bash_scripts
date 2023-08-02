#! /bin/sh

flameshot gui -p ~/images/screenshots

filename=$(ls -rt ~/images/screenshots | tail -n 1)

file_rename=$(echo "file name" | dmenu)

mv ~/images/screenshots/${filename} ~/images/screenshots/${file_rename}

cat /home/uriel/images/screenshots/"${file_rename}" | xclip -selection clipboard -target image/png -i
