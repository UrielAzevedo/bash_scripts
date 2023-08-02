#! /bin/sh

btc_price=$(curl -X 'GET' 'https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd')
btc_price=${btc_price%%"}"*}
btc_price=${btc_price##*":"}
echo ${btc_price}
