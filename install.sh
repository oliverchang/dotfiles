#!/bin/sh

ln -s `pwd`/vim/vimrc "$HOME/.vimrc"
ln -s `pwd`/vim/gvimrc "$HOME/.gvimrc"
ln -s `pwd`/zsh/zshrc "$HOME/.zshrc"

mkdir -p "$HOME/.vim"
ln -s `pwd`/vim/colors "$HOME/.vim"
