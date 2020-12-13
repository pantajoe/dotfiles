#!/bin/sh

echo "\033[32m\033[1m***** Initialize MacOS Setup! ******\033[0m"

util_dir=$(dirname "$0")

# 1. DevTools
echo "\033[33m\033[1m***** Installing DevTools (Git, Docker, etc.) *****\033[0m"
xcode-select --install

echo "\033[33m\033[1m***** Installing Homebrew *****\033[0m"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "\033[32m\033[1m***** Homebrew installed successfully *****\033[0m"

brew update
brew install \
  coreutils \
  unzip \
  openssl@1.1 \
  readline \
  gpg \
  curl \
  git \
  docker \
  docker-compose \
  gh
echo "\033[32m\033[1m***** DevTools (Git, Docker, etc.) installed successfully *****\033[0m"

# 2. Fish
echo "\033[33m\033[1m***** Installing Fish *****\033[0m"
brew install \
  fish \
  starship \
  fortune

exec "${util_dir}/fish_setup.sh"
echo "\033[32m\033[1m***** Fish installed successfully *****\033[0m"

# 3. ASDF VM
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0
mkdir -p ~/.config/fish/completions && cp ~/.asdf/completions/asdf.fish ~/.config/fish/completions
exec "${util_dir}/asdf_setup.sh"

# 4. QuickLook Plugins, Fonts, LaTeX
echo "\033[33m\033[1m***** Installing QuickLook Plugins *****\033[0m"
brew install --cask \
  qlmarkdown \
  qlcolorcode \
  qlstephen

xattr -cr ~/Library/QuickLook/QLColorCode.qlgenerator
xattr -cr ~/Library/QuickLook/QLMarkdown.qlgenerator
xattr -cr ~/Library/QuickLook/QLStephen.qlgenerator

qlmanage -r
qlmanage -r cache
echo "\033[32m\033[1m***** QuickLook Plugins installed successfully *****\033[0m"


echo "\033[33m\033[1m***** Installing Fonts (Fira Code, Hack Nerd Font, JetBrains Mono) *****\033[0m"
brew tap homebrew/cask-fonts
brew install --cask \
  font-hack-nerd-font \
  font-fira-code \
  font-jetbrains-mono
echo "\033[32m\033[1m***** Fonts (Fira Code, Hack Nerd Font, JetBrains Mono) installed successfully *****\033[0m"

echo "\033[33m\033[1m***** Installing LaTeX *****\033[0m"
brew install --cask mactex-no-gui
echo "\033[32m\033[1m***** LaTeX installed successfully *****\033[0m"

# 5. Applications
echo "\033[33m\033[1m***** Installing Visual Studio Code *****\033[0m"
brew install --cask visual-studio-code
echo "\033[32m\033[1m***** Visual Studio Code installed successfully ******\033[0m"

echo "\033[33m\033[1m***** Installing ITerm2 *****\033[0m"
brew install --cask iterm2
echo "\033[32m\033[1m***** ITerm2 installed successfully ******\033[0m"

echo "\033[33m\033[1m***** Installing Firefox Developer Edition *****\033[0m"
brew install --cask firefox-developer-edition
echo "\033[32m\033[1m***** Firefox Developer Edition installed successfully ******\033[0m"

echo "\033[33m\033[1m***** Installing Google Chrome *****\033[0m"
brew install --cask google-chrome
echo "\033[32m\033[1m***** Google Chrome installed successfully ******\033[0m"

echo "\033[33m\033[1m***** Installing Docker Desktop *****\033[0m"
brew install --cask docker
echo "\033[32m\033[1m***** Docker Desktop installed successfully ******\033[0m"

echo "\033[33m\033[1m***** Installing Dash *****\033[0m"
brew install --cask dash
echo "\033[32m\033[1m***** Dash installed successfully ******\033[0m"

echo "\033[33m\033[1m***** Installing TablePlus *****\033[0m"
brew install --cask tableplus
echo "\033[32m\033[1m***** TablePlus installed successfully ******\033[0m"

echo "\033[33m\033[1m***** Installing Notion *****\033[0m"
brew install --cask notion
echo "\033[32m\033[1m***** Notion installed successfully ******\033[0m"

echo "\033[33m\033[1m***** Installing MonitorControl *****\033[0m"
brew install --cask monitorcontrol
echo "\033[32m\033[1m***** MonitorControl installed successfully ******\033[0m"

echo "\033[33m\033[1m***** Installing Spotify *****\033[0m"
brew install --cask spotify
echo "\033[32m\033[1m***** Spotify installed successfully ******\033[0m"

echo "\033[33m\033[1m***** Installing Adobe Acrobat Reader DC *****\033[0m"
brew install --cask adobe-acrobat-reader
echo "\033[32m\033[1m***** Adobe Acrobat Reader DC installed successfully ******\033[0m"

echo "\033[33m\033[1m***** Installing 1Password 7 *****\033[0m"
brew install --cask 1password
echo "\033[32m\033[1m***** 1Password 7 installed successfully ******\033[0m"

echo "\033[33m\033[1m***** Installing Figma *****\033[0m"
brew install --cask figma
echo "\033[32m\033[1m***** Figma installed successfully ******\033[0m"

echo "\033[33m\033[1m***** Installing Altair GraphQL Client *****\033[0m"
brew install --cask altair-graphql-client
echo "\033[32m\033[1m***** Altair GraphQL Client installed successfully ******\033[0m"

echo "\033[33m\033[1m***** Installing MacsFanControl *****\033[0m"
brew install --cask macs-fan-control
echo "\033[32m\033[1m***** MacsFanControl installed successfully ******\033[0m"

echo "\033[33m\033[1m***** Installing QMK Toolbox *****\033[0m"
brew tap homebrew/cask-drivers
brew install --cask qmk-toolbox
echo "\033[32m\033[1m***** QMK Toolbox installed successfully ******\033[0m"

echo "\033[33m\033[1m***** Installing Zoom.us *****\033[0m"
brew install --cask zoom
echo "\033[32m\033[1m***** Zoom.us installed successfully ******\033[0m"

echo "\033[33m\033[1m***** Installing Typora *****\033[0m"
brew install --cask typora
echo "\033[32m\033[1m***** Typora installed successfully ******\033[0m"

echo "\033[32m\033[1m***** MacOS Setup completed successfully! ******\033[0m"
