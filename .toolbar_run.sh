#! /bin/sh

delimeter='|'

day_time=$(date +%a' '%b' '%d' '%I':'%M' '%p)

volume=$(amixer sget Master | grep Mono)
volume=${volume%%]*}
volume=${volume##*[}

cpu_temp=$(sensors | grep Tctl | awk '{print $2}')
cpu_temp=${cpu_temp%%+ *}

internet="($(nmcli network connectivity))"

btc_price=$(curl -s -X 'GET' 'https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd')
btc_price=${btc_price%%"}"*}
btc_price=${btc_price##*":"}

mem=$(free --mega | grep Mem | awk '{print $3}')

toolbar="${delimeter} BTC ${btc_price} ${delimeter}  WLAN0 ${internet} ${internet_icon} ${delimeter} VOL ${volume} ${delimeter} MEM ${mem} ${delimeter} ${cpu_temp} ${delimeter}  ${day_time} " 

echo ${toolbar}



