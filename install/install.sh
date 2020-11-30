#!/bin/sh
# Pick the correct install script based on the current OS

util_dir=$(dirname "$0")

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
