#!/bin/sh

networkstatus=$(nmcli -t -f STATE g)

if [ "$networkstatus" = "connected" ]; then
    network="ON"
else
    network="OFF"
fi

echo $network

