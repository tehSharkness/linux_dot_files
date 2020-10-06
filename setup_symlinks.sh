#!/bin/bash

rm "${HOME}/.zshrc"
ln -s "$(pwd)/.zshrc" "${HOME}/.zshrc"

mkdir -p "${HOME}/.atom"
rm -f "${HOME}/.atom/config.cson"
ln -s "$(pwd)/atom/config.cson" "${HOME}/.atom/config.cson"

mkdir -p "${HOME}/.config/terminator"
rm -f "${HOME}/.config/terminator/config"
ln -s "$(pwd)/terminator/config" "${HOME}/.config/terminator/config"

mkdir -p "${HOME}/.config/regolith/i3"
rm -f "${HOME}/.config/regolith/i3/config"
rm -f "${HOME}/.config/regolith/i3/status.toml"
ln -s "$(pwd)/regolith/config" "${HOME}/.config/regolith/i3/config"
ln -s "$(pwd)/regolith/status.toml" "${HOME}/.config/regolith/i3/status.toml"

mkdir -p "${HOME}/.config/autostart"
ln -s "$(pwd)/autostart/dropbox.desktop" "${HOME}/.config/autostart/dropbox.desktop"
ln -s "$(pwd)/autostart/redshift.desktop" "${HOME}/.config/autostart/redshift.desktop"
