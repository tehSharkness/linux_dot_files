#!/bin/bash

sudo apt-get update -y

sudo apt-get install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  wget \
  gnupg-agent \
  software-properties-common

# Add apt keys
## Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add ppa's
sudo add-apt-repository -y ppa:git-core/ppa
sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get update -y

sudo apt-get install -y \
  atom \
  zsh \
  firefox \
  docker-ce \
  docker-ce-cli \
  containerd.io \
  terminator \
  git \
  shellcheck \
  fonts-font-awesome \
  fonts-powerline \
  redshift \
  feh \
  regolith-desktop \
  python3-pip \
  timeshift \
  okular

# oh-my-zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
cp scripts/anaconda3.zsh ${HOME}/.oh-my-zsh/custom/
cp scripts/git_large_files.zsh ${HOME}/.oh-my-zsh/custom/
cp scripts/perl.zsh ${HOME}/.oh-my-zsh/custom/

cwd="$(pwd)"
cd "$(mktemp -d)" || return 1

git clone https://github.com/greshake/i3status-rust
sudo apt-get install -y cargo libdbus-1-dev libssl-dev libsensors-dev
(
  cd i3status-rust
  cargo install --path .
  ./install.sh
)

# Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb
sudo apt-get install -f

# Docker
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

# Nomachine
# sensible-browser "https://www.nomachine.com/download/linux&id=1"

return 0
