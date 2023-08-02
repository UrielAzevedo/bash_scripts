#! /bin/sh

cpu_temp=$(sensors | grep Tctl | awk '{print $2}')
cpu_temp=${cpu_temp%%+ *}

echo ${cpu_temp}
