#!/bin/sh

is_linux() {
  grep ID /etc/os-release | grep -qE 'debian|ubuntu'
}

install_language() {
  lang=$1
  version=$2

  # Install asdf language plugin
  asdf plugin-add $lang

  # Instal prerequesities for installing a specific version of a language
  case $lang in
  erlang)
    if is_linux; then
      sudo apt-get -y install \
        build-essential \
        autoconf \
        m4 \
        libncurses5-dev \
        libwxgtk3.0-gtk3-dev \
        libgl1-mesa-dev \
        libglu1-mesa-dev \
        libpng-dev \
        libssh-dev \
        unixodbc-dev \
        xsltproc \
        fop \
        libxml2-utils \
        libncurses-dev \
        openjdk-11-jdk
    else
      brew install autoconf
    fi
  ;;
  nodejs)
    bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'
  ;;
  *)
  ;;
  esac

  # Install version of language
  echo "\033[1mSpecify a version for $lang. If you don't specify one, the default version is $version.\033[0m"
  while read -r SPECIFIED_VERSION; do
    if [ -z "$SPECIFIED_VERSION" ]; then
      SPECIFIED_VERSION=$version
    fi

    if asdf list-all $lang | grep -w "^$SPECIFIED_VERSION\$"; then
      asdf install $lang $SPECIFIED_VERSION
      echo "\033[32m\033[1m$lang $SPECIFIED_VERSION successfully installed.\033[0m"

      echo "\033[1mWould you like for $lang@$SPECIFIED_VERSION to be your default version for $lang? [y/n]\033[0m"
      while read -r ANSWER; do
        case $ANSWER in
        y | Y)
          asdf global $lang $SPECIFIED_VERSION
          echo "\033[33m\033[1m$lang@$SPECIFIED_VERSION is now your default version for $lang.\033[0m"
          break
        ;;
        n | N)
          break
        ;;
        *)
          echo "\033[1mWould you like for $lang@$SPECIFIED_VERSION to be your default version for $lang? [y/n]\033[0m"
        ;;
        esac
      done

      echo "\033[1mWould you like to install another version for $lang? [y/n]\033[0m"
      while read -r ANSWER; do
        case $ANSWER in
        y | Y)
          echo "\033[1mSpecify another version for $lang. If you don't specify one, the default version is $version.\033[0m"
          break
        ;;
        n | N)
          break 2
        ;;
        *)
          echo "\033[1mWould you like to install another version for $lang? [y/n]\033[0m"
        ;;
        esac
      done
    else
      echo "\033[31m\033[1mVersion $SPECIFIED_VERSION does not exist for $lang. Please choose one of the available versions:\033[0m"
      asdf list-all $lang
    fi
  done
}

echo "\033[33m\033[1m***** Setup ASDF VM *****\033[0m"

# convert .tool-versions to languages array in the following format:
#   ruby_2.7.1:nodejs_15.0.1:...
languages=$(tr '\n' ':' < ~/.tool-versions | sed 's/.$//' | tr ' ' '_')
IFS=':'

for lang_with_version in $languages; do
  lang=$(echo $lang_with_version | cut -d '_' -f1)
  version=$(echo $lang_with_version | cut -d '_' -f2)

  echo "\033[1mWould you like to install $lang now? [y/n]\033[0m"

  while read -r ANSWER; do
    case $ANSWER in
    y | Y)
      install_language $lang $version
      break
      ;;
    n | N)
      break
      ;;
    *)
      echo "\033[1mWould you like to install $lang now? [y/n]\033[0m"
      ;;
    esac
  done
done

IFS=' '
echo "\033[32m\033[1m***** ASDF VM setup complete *****\033[0m"
