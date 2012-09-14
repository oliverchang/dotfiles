#!/bin/sh

ln -sf `pwd`/vim/vimrc "$HOME/.vimrc"
ln -sf `pwd`/vim/gvimrc "$HOME/.gvimrc"
ln -sf `pwd`/zsh/zshrc "$HOME/.zshrc"

mkdir -p "$HOME/.vim"
mkdir -p "$HOME/.vim/colors"
mkdir -p "$HOME/.vim/bundle"
mkdir -p "$HOME/.vim/autoload"

ln -sf `pwd`/vim/colors/* "$HOME/.vim/colors"
ln -sf `pwd`/vim/bundle/* "$HOME/.vim/bundle"
ln -sf `pwd`/vim/autoload/* "$HOME/.vim/autoload"

git submodule init
git submodule update
