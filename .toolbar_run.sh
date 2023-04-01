#! /bin/sh

delimeter='|'
battery_percentage=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep 'percentage' | awk '{print $2}')
bat_state=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep state | awk '{print $2}')

if [ "$bat_state" = "discharging" ]; then
	
	bat_state='(disch)'

elif [ "$bat_state" == "charging" ]; then

	bat_state='(char)'

else

	bat_state='(full)'

fi

day_time=$(date +%a' '%b' '%d' '%I':'%M' '%p)

volume=$(amixer sget Master | grep Left)
volume=${volume%%]*}
volume=${volume##*[}

cpu_temp=$(sensors | grep Tctl | awk '{print $2}')
cpu_temp=${cpu_temp%%+ *}

if [ "${internet}" = "full" ]; then

	internet="(${internet})"

else

	internet="($(nmcli network connectivity))"

fi

toolbar="${delimeter} 🌐 WLAN0 ${internet} ${internet_icon} ${delimeter} 🔊 VOL ${volume} ${delimeter} 🔋 BAT ${bat_state} ${battery_percentage} ${delimeter} 🌡️ ${cpu_temp} ${delimeter} 📅  ${day_time} "


echo ${toolbar}



