#!/bin/sh

ln -sf `pwd`/vim/vimrc "$HOME/.vimrc"
ln -sf `pwd`/vim/gvimrc "$HOME/.gvimrc"
ln -sf `pwd`/zsh/zshrc "$HOME/.zshrc"

ln -sf `pwd`/tmux/tmux.conf "$HOME/.tmux.conf"

if [ `uname` = "Darwin" ]; then
   # Fix copy/paste for OSX
   ln -sf `pwd`/tmux/tmux.conf.osx "$HOME/.tmux.conf.osx"
fi

mkdir -p "$HOME/.vim"
mkdir -p "$HOME/.vim/colors"
mkdir -p "$HOME/.vim/bundle"

ln -sf `pwd`/vim/colors/* "$HOME/.vim/colors"
ln -sf `pwd`/vim/bundle/* "$HOME/.vim/bundle"

git submodule init
git submodule update
