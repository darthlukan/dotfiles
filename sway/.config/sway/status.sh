#!/bin/sh

BAT_STATUS=$(upower -i $(upower -e | \
    grep 'BAT') | \
    grep "state" | \
    awk '{print $2}')

BAT_PERCENTAGE=$(upower -i $(upower -e | grep 'BAT') | \
    grep "percentage" | \
    awk '{print $2}')

DATE_FMT=$(date "+%a %d %b %Y %H:%M:%S")

HOME_TOTAL=$(df -h | grep "home" | awk '{print $2}')
HOME_USED=$(df -h | grep "home" | awk '{print $3}')
HOME_PERCENT=$(df -h | grep "home" | awk '{print $5}')

WIFI_IP4=$(ip -j a | jq '.[1].addr_info[0].local' | sed 's/"//g')
WIFI_SSID=$(nmcli -m tabular -f NAME,TYPE -o c show --active | grep "wifi" | awk '{print $1}')
VPN_ACTIVE=$(nmcli -m tabular -f TYPE -o c show --active | grep "vpn" | awk '{print $1}')

if [ $VPN_ACTIVE == "vpn" ]; then
    VPN_STATE="🔒"
else
    VPN_STATE="🔓"
fi

echo -n "💾 $HOME_USED/$HOME_TOTAL $HOME_PERCENT | 📡 $WIFI_SSID $WIFI_IP4 $VPN_STATE | ⚡ $BAT_STATUS $BAT_PERCENTAGE | 🗓 $DATE_FMT"
