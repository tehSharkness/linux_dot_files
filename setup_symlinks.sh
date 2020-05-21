#!/bin/bash

rm ~/.zshrc
rm ~/.atom/config.cson

mkdir -p ~/.atom
mkdir -p ~/.config/terminato

ln -s $(pwd)/.zshrc ~/.zshrc
ln -s $(pwd)/atom/config.cson ~/.atom/config.cson

# commented out while I try out regolith
# ln -s $(pwd)/i3/* ~/.config/i3/
# ln -s $(pwd)/compton.conf ~/compton.conf

# for compton, I think
# sudo ln -s /lib/x86_64-linux-gnu/libpcre.so.3 /lib/x86_64-linux-gnu/libpcre.so.1

ln -s $(pwd)/autostart/* ~/.config/autostart/
ln -s $(pwd)/terminator/config ~/.config/terminator/config
