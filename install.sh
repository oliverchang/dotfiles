#!/bin/sh

ln -sf `pwd`/vim/vimrc "$HOME/.vimrc"
ln -sf `pwd`/vim/gvimrc "$HOME/.gvimrc"
ln -sf `pwd`/zsh/zshrc "$HOME/.zshrc"

mkdir -p "$HOME/.vim"
mkdir -p "$HOME/.vim/colors"

ln -sf `pwd`/vim/colors/* "$HOME/.vim/colors"
