#!/bin/bash

sudo apt-get install -y wget

# wine
sudo dpkg --add-architecture i386
wget -O - https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -
sudo add-apt-repository -y "deb https://dl.winehq.org/wine-builds/ubuntu/ $(lsb_release -cs) main"

# lutris
sudo add-apt-repository -y ppa:lutris-team/lutris

sudo apt-get update -y
sudo apt-get install -y --install-recommends \
  winehq-staging \
  gamemode \
  steam \
  lutris
