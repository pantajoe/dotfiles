# Dotfiles

## Getting Started

- Clone this repo: `git clone --bare git@github.com:pantajoe/dotfiles.git $HOME/.dotfiles`
- Define an alias in the current shell scope: `alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'`
- Checkout the actual content from the repo to `$HOME`: `dotfiles checkout`
- Execute `bootstrap.sh` to install all dependencies

## Contribute to your Dotfiles

```bash
dotfiles status
dotfiles add .dotfilerc
dotfiles commit -m "add configuration stuff"
dotfiles push
```

## How to Create your own Dotfiles?

Read [this Medium article](https://medium.com/toutsbrasil/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b).

&copy; Joe Pantazidis
