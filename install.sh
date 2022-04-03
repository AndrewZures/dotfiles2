#!/bin/sh

zshrc() {
  echo "==========================================================="
  echo "                  Import zsh files                             "
  echo "-----------------------------------------------------------"
  cat .zshenv > $HOME/.zshenv
}

zshrc
