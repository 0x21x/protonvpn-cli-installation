#!/bin/bash

protonvpn-cli ks --off
protonvpn-cli ks --permanent
protonvpn-cli c -f

title="PROTON VPN"

if protonvpn-cli status | grep -q 'disconnected'
        then
                notify-send -u critical "$title" '!!!! VPN NOT CONNECTED !!!!'
        else
                ks="$(protonvpn-cli status | grep -oP 'switch:  \K.*')"
                ip="$(protonvpn-cli status | grep -oP 'IP:              \K.*')"
                server="$(protonvpn-cli status | grep -oP 'Server:      \K.*')"
                notification=$(echo "KS:${ks} | IP:${ip} | SERVER:${server}")
                notify-send -u normal "$title" "$notification" 
fi
