# Dotfiles

This are my personal dotfiles. The strategy is to symlink all dotfiles from the cloned repository

## Installation

### MacOS and Debian-based Linux

Simply execute the following script in any shell of your choice:

```shell
curl -L https://github.com/pantajoe/dotfiles/tree/main/install/install.sh | sh
```

*(Note: On Linux, you will also be provided with some programs. However, if you execute this from a WSL, no GUI programs will be installed.)*

### Windows

Simply execute the following in an elevated PowerShell:

```ps1
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://github.com/pantajoe/dotfiles/tree/main/install/windows_install.ps1'))
```

*(Note: Only Programs and WSL2 are going to be setup on Windows. To setup your WSL, execute the script above.)*

&copy; Joe Pantazidis
