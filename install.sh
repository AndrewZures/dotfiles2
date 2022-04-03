#!/bin/bash

zshrc() {
  echo "==========================================================="
  echo "                  Import dotfiles                          "
  echo "-----------------------------------------------------------"
  cat .zshenv > $HOME/.zshenv
  source $HOME/.zshenv
  cat .gitconfig > $HOME/.gitconfig
}

zshrc
