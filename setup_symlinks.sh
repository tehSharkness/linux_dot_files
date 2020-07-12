#!/bin/bash

rm ${HOME}/.zshrc
rm ${HOME}/.atom/config.cson

mkdir -p ${HOME}/.atom
mkdir -p ${HOME}/.config/terminator

ln -s $(pwd)/.zshrc ${HOME}/.zshrc
ln -s $(pwd)/atom/config.cson ${HOME}/.atom/config.cson

ln -s $(pwd)/autostart/* ${HOME}/.config/autostart/
ln -s $(pwd)/terminator/config ${HOME}/.config/terminator/config

mkdir -p ${HOME}/.config/regolith/i3

rm ${HOME}/.config/regolith/i3/config
rm ${HOME}/.config/regolith/i3/status.toml

ln -s $(pwd)/regolith/config ${HOME}/.config/regolith/i3/config
ln -s $(pwd)/regolith/status.toml ${HOME}/.config/regolith/i3/status.toml
