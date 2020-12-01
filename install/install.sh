#!/bin/sh

util_dir=$(dirname "$0")

# Copy Dotfiles
git clone --bare https://github.com/pantajoe/dotfiles.git $HOME/.dotfiles
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
(cd ~ && dotfiles checkout -f)

# Pick the correct install script based on the current OS
case $(uname -a) in
  *Darwin*)
    exec "${util_dir}/macos_install.sh"
  ;;
  *Linux*)
    exec "${util_dir}/linux_install.sh"
  ;;
  *)
    echo "\e[31m\e[1mEnvironment not supported.\e[0m"
    exit 1
  ;;
esac
