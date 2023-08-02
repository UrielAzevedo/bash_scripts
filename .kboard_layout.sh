current_layout=$(setxkbmap -query | grep layout | awk '{print $2}')

[ "${current_layout}" = "us" ] && setxkbmap br || setxkbmap us
