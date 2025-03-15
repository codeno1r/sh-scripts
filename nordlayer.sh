#!/bin/sh

nordstatus=$(nordlayer status --silent | grep VPN | sed s/'VPN: '//)

if [ "$nordstatus" = "Not Connected" ] || [ "$nordstatus" = "Disconnected" ]; then
    mtrgateway=$(nordlayer gateways --silent | grep MTR | sed s/'         MTR │ '// | sed s/'│'//)
    nordlayer connect $mtrgateway --silent
    vpn="ON"
else
    nordlayer disconnect --silent
    vpn="OFF"
fi

echo $vpn
