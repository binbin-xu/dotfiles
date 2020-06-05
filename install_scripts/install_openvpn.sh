#!/bin/bash

echo_green () {
    echo -e "\033[92m$*\033[0m"
} 

set -x

sudo wget -O - https://swupdate.openvpn.net/repos/repo-public.gpg | sudo apt-key add -

sudo echo "deb http://build.openvpn.net/debian/openvpn/stable $(lsb_release -cs)  main" > /etc/apt/sources.list.d/openvpn-aptrepo.list

sudo apt-get update

sudo apt-get install openvpn

echo_green "Done!"
echo_green "Run as: sudo openvpn --config my.ovpn "

set +x
