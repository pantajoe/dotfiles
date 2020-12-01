# Dotfiles

This are my personal dotfiles.

## Installation

### MacOS and Debian-based Linux

Simply execute the following script in any shell of your choice:

```shell
git clone https://github.com/pantajoe/dotfiles.git ~/dotfiles-installation
sh ~/dotfiles-installation/install/install.sh
rm -rf ~/dotfiles-installation
```

*(Note: On Linux, you will also be provided with some programs. However, if you execute this from a WSL, no GUI programs will be installed.)*

### Windows

You need to install the Windows Package Manager [`winget`](https://github.com/microsoft/winget-cli).
Then, simply execute the following in an elevated PowerShell:

```ps1
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://github.com/pantajoe/dotfiles/raw/main/install/windows_install.ps1'))
```

*(Note: Only Programs and WSL2 are going to be setup on Windows. To setup your WSL, execute the script above.)*

## Contribute to Dotfiles

```bash
dotfiles status
dotfiles add .dotfilerc
dotfiles commit -m "add configuration stuff"
dotfiles push
```
