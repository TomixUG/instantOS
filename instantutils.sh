#!/bin/bash

# wrapper script for other installation scripts

USAGE="usage: instantutils install
instantutils root
instantutils user
instantutils repo
instantutils alttab
instantutils refresh"

if [ -z "$1" ]; then
    echo "$USAGE"
    exit
fi

case "$1" in
install)
    sudo /usr/share/instantutils/install.sh
    ;;
root)
    sudo /usr/share/instantutils/rootinstall.sh
    ;;
default)
    /usr/share/instantutils/setup/defaultapps
    ;;
alttab)
    alttab -fg "#ffffff" -bg "#292F3A" -frame "#5293E1" -d 0 -s 1 -t 128x150 -i 127x64 -w 1 -vp pointer &
    ;;
user)
    /usr/share/instantutils/userinstall.sh
    ;;
open)
    if ! [ -e ~/.config/instantos/default/"$1" ]
    then
        instantutils default
        chmod +x ~/.config/instantos/default/"$1"
    fi
    ~/.config/instantos/default/"$1"
    ;;
esac
