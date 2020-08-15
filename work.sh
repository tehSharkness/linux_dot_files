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

## Atom
wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -

## Dropbox
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 1C61A2656FB57B7E4DE0F4C1FC918B335044912E

# Add ppa's
sudo add-apt-repository -y "deb [arch=amd64] https://linux.dropbox.com/ubuntu $(lsb_release -cs) main"
sudo add-apt-repository -y "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main"
sudo add-apt-repository -y ppa:regolith-linux/release
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
cd "$(mktemp)" || return 1

git clone https://github.com/greshake/i3status-rust
sudo apt-get install -y cargo libdbus-1-dev
(cd i3status-rust && cargo build --release)
chmod +x i3status-rust/target/release/i3status-rs
sudo cp i3status-rust/target/release/i3status-rs /usr/local/bin/

# Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb
sudo apt-get install -f

# Anaconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod +x Miniconda3-latest-Linux-x86_64.sh
./Miniconda3-latest-Linux-x86_64.sh

cd "${cwd}" || return 2

# autorandr
sudo pip install autorandr

# Docker
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

# Nomachine
sensible-browser "https://www.nomachine.com/download/linux&id=1"

return 0
