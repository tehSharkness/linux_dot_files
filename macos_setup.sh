#!/bin/bash

xcode-select --install

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# add kde tap
brew tap kde-mac/kde https://invent.kde.org/packaging/homebrew-kde.git --force-auto-update
"$(brew --repo kde-mac/kde)/tools/do-caveats.sh"

brew install \
  zsh \
  git \
  redshift \
  python \
  kde-mac/kde/okular \
  kde-mac/kde/dolphin

brew cask install \
  firefox \
  iterm2 \
  adobe-creative-cloud \
  microsoft-word \
  microsoft-excel \
  microsoft-powerpoint \
  nomachine \
  lingon-x

# powerline
(
  cd "$(mktemp -d)" && \
  git clone https://github.com/powerline/fonts.git --depth=1 && \
  cd fonts && \
  ./install.sh
)

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

rm "${HOME}/.zshrc"
ln -s "$(pwd)/.zshrc" "${HOME}/.zshrc"
