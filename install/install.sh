#!/bin/sh

# Copy Dotfiles
git clone --bare git@github.com:pantajoe/dotfiles.git $HOME/.dotfiles
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
(cd ~ && dotfiles checkout -f)

# Pick the correct install script based on the current OS
case $(uname -a) in
  *Darwin*)
    curl -L https://github.com/pantajoe/dotfiles/raw/main/install/macos_install.sh | sh
  ;;
  *Linux*)
    curl -L https://github.com/pantajoe/dotfiles/raw/main/install/linux_install.sh | sh
  ;;
  *)
    echo "\e[31m\e[1mEnvironment not supported.\e[0m"
    exit 1
  ;;
esac
