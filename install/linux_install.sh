#!/bin/sh

echo "\033[32m\033[1m***** Initialize Linux Setup! ******\033[0m"

if ! grep ID /etc/os-release | grep -qE 'debian|ubuntu'; then
  echo "\033[31m\033[1mError: Only Debian and Ubuntu are supported.\033[0m"
  exit 1
fi

# 1. DevTools
echo "\033[33m\033[1m***** Installing DevTools (Git, Docker, etc.) *****\033[0m"
sudo apt-get -y update
sudo apt-get -y install \
  git-core \
  curl \
  unzip \
  wget \
  dirmngr \
  gpg \
  docker \
  docker-compose \
  zlib1g-dev \
  build-essential \
  libssl-dev \
  libreadline-dev \
  libyaml-dev \
  libsqlite3-dev \
  sqlite3 \
  libxml2-dev \
  libxslt1-dev \
  libcurl4-openssl-dev \
  software-properties-common \
  libffi-dev
echo "\033[32m\033[1m***** DevTools (Git, Docker, etc.) installed successfully *****\033[0m"

# 2. Fish
echo "\033[33m\033[1m***** Installing Fish *****\033[0m"
sudo apt-get -y install \
  fortune \
  fish

echo "\033[1m***** Installing Starship Prompt *****\033[0m"
curl -fsSL https://starship.rs/install.sh | bash
echo "\033[1m***** Starship Prompt installed successfully *****\033[0m"

curl -L https://github.com/pantajoe/dotfiles/raw/main/install/fish_setup.sh | sh
echo "\033[32m\033[1m***** Fish installed successfully *****\033[0m"

# 3. ASDF VM
curl -L https://github.com/pantajoe/dotfiles/raw/main/install/asdf_setup.sh | sh

# 4. Fonts & LaTeX
echo "\033[33m\033[1m***** Installing Fonts (Fira Code, Hack Nerd Font, JetBrains Mono) *****\033[0m"
sudo apt-get -y install \
  fonts-firacode \
  fonts-hack-ttf

# Install JetBrains Mono
mkdir -p ~/.local/share/fonts
wget https://download.jetbrains.com/fonts/JetBrainsMono-2.001.zip
unzip JetBrainsMono-2.001.zip
mv JetBrainsMono-*.ttf ~/.local/share/fonts/
rm JetBrainsMono-2.001.zip
echo "\033[32m\033[1m***** Fonts (Fira Code, Hack Nerd Font, JetBrains Mono) installed successfully *****\033[0m"

echo "\033[33m\033[1m***** Installing LaTeX *****\033[0m"
sudo apt-get -y install \
  texlive \
  latexmk \
  chktex \
  libsynctex2
echo "\033[32m\033[1m***** LaTeX installed successfully *****\033[0m"

# 5. Applications

if uname -a | grep -qi microsoft; then
  echo "\033[31m\033[1m********************************************************************************\033[0m"
  echo "\033[31m\033[1m* Detected Windows Subsystem for Linux.                                        *\033[0m"
  echo "\033[31m\033[1m* No applications will be installed.                                           *\033[0m"
  echo "\033[31m\033[1m********************************************************************************\033[0m"
  echo
else
  # Install UMake
  echo "\033[33m\033[1m***** Installing UMake *****\033[0m"
  sudo add-apt-repository ppa:lyzardking/ubuntu-make
  sudo apt-get -y update
  sudo apt-get -y install ubuntu-make
  echo "\033[32m\033[1m***** UMake installed successfully *****\033[0m"

  # Install Snap
  echo "\033[33m\033[1m***** Installing Snap *****\033[0m"
  sudo apt=get -y install snapd
  echo "\033[32m\033[1m***** Snap installed successfully *****\033[0m"

  # Install applications
  echo "\033[33m\033[1m***** Installing Visual Studio Code *****\033[0m"
  sudo snap install code --classic
  echo "\033[32m\033[1m***** Visual Studio Code installed successfully *****\033[0m"

  echo "\033[33m\033[1m***** Installing 1Password 7 ******\033[0m"
  sudo snap install 1password --edge
  echo "\033[32m\033[1m***** 1Password 7 installed successfully ******\033[0m"

  echo "\033[33m\033[1m***** Installing Slack ******\033[0m"
  sudo snap install slack --classic
  echo "\033[32m\033[1m***** Slack installed successfully ******\033[0m"

  echo "\033[33m\033[1m***** Installing Spotify ******\033[0m"
  sudo snap install spotify
  echo "\033[32m\033[1m***** Spotify installed successfully ******\033[0m"

  echo "\033[33m\033[1m***** Installing Adobe Acrobat Reader DC ******\033[0m"
  sudo snap install acrordrdc
  echo "\033[32m\033[1m***** Adobe Acrobat Reader DC installed successfully ******\033[0m"

  echo "\033[33m\033[1m***** Installing Figma Linux ******\033[0m"
  sudo snap install figma-linux
  echo "\033[32m\033[1m***** Figma Linux installed successfully ******\033[0m"

  echo "\033[33m\033[1m***** Installing Altair GraphQL Client ******\033[0m"
  sudo snap install altair
  echo "\033[32m\033[1m***** Altair GraphQL Client installed successfully ******\033[0m"

  echo "\033[33m\033[1m***** Installing Whatsdesk (WhatsApp Desktop) ******\033[0m"
  sudo snap install whatsdesk
  echo "\033[32m\033[1m***** Whatsdesk (WhatsApp Desktop) installed successfully ******\033[0m"

  echo "\033[33m\033[1m***** Installing Mailspring ******\033[0m"
  sudo snap install mailspring
  echo "\033[32m\033[1m***** Mailspring installed successfully ******\033[0m"

  echo "\033[33m\033[1m***** Installing Typora ******\033[0m"
  sudo snap install typora
  echo "\033[32m\033[1m***** Typora installed successfully ******\033[0m"

  echo "\033[33m\033[1m***** Installing Libre Office ******\033[0m"
  sudo snap install libreoffice
  echo "\033[32m\033[1m***** Libre Office installed successfully ******\033[0m"

  echo "\033[33m\033[1m***** Installing Firefox Developer Edition ******\033[0m"
  umake firefox-dev
  echo "\033[32m\033[1m***** Firefox Developer Edition installed successfully ******\033[0m"

  # Install Google Chrome
  echo "\033[33m\033[1m***** Installing Google Chrome ******\033[0m"
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo apt -y install ./google-chrome-stable_current_amd64.deb
  rm google-chrome-stable_current_amd64.deb
  echo "\033[32m\033[1m***** Google Chrome installed successfully ******\033[0m"

  # Install Docker
  echo "\033[33m\033[1m***** Installing Docker Desktop ******\033[0m"
  sudo apt-get -y install docker.io
  echo "\033[32m\033[1m***** Docker Desktop installed successfully ******\033[0m"

  echo "\033[33m\033[1m***** Installing Dash ******\033[0m"
  sudo apt-get -y install dash
  echo "\033[32m\033[1m***** Dash installed successfully ******\033[0m"

  # Install TablePlus
  echo "\033[33m\033[1m***** Installing TablePlus ******\033[0m"
  wget -O - -q http://deb.tableplus.com/apt.tableplus.com.gpg.key | sudo apt-key add -
  sudo add-apt-repository "deb [arch=amd64] https://deb.tableplus.com/debian tableplus main"
  sudo apt update
  sudo apt-get -y install tableplus
  echo "\033[32m\033[1m***** TablePlus installed successfully ******\033[0m"

  # Install Zoom
  echo "\033[33m\033[1m***** Installing Zoom.us ******\033[0m"
  wget https://zoom.us/client/latest/zoom_amd64.deb
  sudo apt -y install ./zoom_amd64.deb
  rm zoom_amd64.deb
  echo "\033[32m\033[1m***** Zoom.us installed successfully ******\033[0m"

  # Install Sciebo
  echo "\033[33m\033[1m***** Installing Sciebo ******\033[0m"
  wget -nv https://www.sciebo.de/install/linux/Ubuntu_20.04/Release.key -O - | sudo apt-key add -
  echo 'deb https://www.sciebo.de/install/linux/Ubuntu_20.04/ /' | sudo tee -a /etc/apt/sources.list.d/owncloud.list
  sudo apt -y update
  sudo apt -y install sciebo-client
  echo "\033[32m\033[1m***** Sciebo installed successfully ******\033[0m"

  # Install NordVPN
  echo "\033[33m\033[1m***** Installing NordVPN (CLI) ******\033[0m"
  wget -qnc https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb
  sudo dpkg -i nordvpn-release_1.0.0_all.deb
  sudo wget https://repo.nordvpn.com/gpg/nordvpn_public.asc -O - | sudo apt-key add -
  sudo apt-get -y update
  sudo apt-get -y install nordvpn
  echo "\033[32m\033[1m***** NordVPN (CLI) installed successfully ******\033[0m"
fi

echo "\033[32m\033[1m***** Linux Setup completed successfully! ******\033[0m"
