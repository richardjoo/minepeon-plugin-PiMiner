#!/bin/bash

echo "$c2            _                                   "
echo "$c2           (_)                                  "
echo "$c2  _ __ ___  _ _ __   ___ _ __   ___  ___  _ __  "
echo "$c2 |  _   _ \| |  _ \ / _ \  _ \ / _ \/ _ \|  _ \ "
echo "$c2 | | | | | | | | | |  __/ |_) |  __/ (_) | | | |"
echo "$c2 |_| |_| |_|_|_| |_|\___|  __/ \___|\___/|_| |_|"
echo "$c2                        | |                     "
echo "$c2                        |_|"
echo
echo "This will install the PiMiner LCD plugin for your MinePeon"
echo "it will require sudo access to install the service and ask"
echo "you for your password"
echo 
echo "You will need an Adafruit 16x2 LCD+Keypad Kit for Raspberry Pi"
echo "avalible from http://www.adafruit.com/. The origional code and"
echo "libraries are availible from https://github.com/adafruit/PiMiner"
echo "and https://github.com/adafruit/Adafruit-Raspberry-Pi-Python-Code"
echo
echo "Once it is going you will need to adjust the potentiometer "
echo "(the thing between the chip and the buttons) to adjust the "
echo "contrast. (Thank 6010fd12 for that tip)"
echo
echo

read -p "Are you sure? [y/n]" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then

mkdir -p /opt/minepeon/plugin
cp -rf PiMiner /opt/minepeon/plugin/


sudo cp service/piminer.service /usr/lib/systemd/system/
sudo systemctl daemon-reload
sudo systemctl start piminer.service
sudo systemctl enable piminer.service

fi

