#!/bin/sh

echo "Creating symlinks to config files..."
ln -sf `pwd`/vim/vimrc "$HOME/.vimrc"
ln -sf `pwd`/vim/gvimrc "$HOME/.gvimrc"
ln -sf `pwd`/zsh/zshrc "$HOME/.zshrc"

ln -sf `pwd`/tmux/tmux.conf "$HOME/.tmux.conf"

if [ `uname` = "Darwin" ]; then
   # Fix copy/paste for OSX
   echo "Creating a symlink to a tmux copy/paste fix for OSX..."
   ln -sf `pwd`/tmux/tmux.conf.osx "$HOME/.tmux.conf.osx"
fi

echo "Creating .vim folder..."
mkdir -p "$HOME/.vim"
mkdir -p "$HOME/.vim/colors"
mkdir -p "$HOME/.vim/bundle"

echo "Creating symlinks to vim colors and bundle.."
ln -sf `pwd`/vim/colors/* "$HOME/.vim/colors"
ln -sf `pwd`/vim/bundle/* "$HOME/.vim/bundle"

echo "Updating git submodules..."
git submodule init
git submodule update

echo "Running :BundleInstall from vim"
vim +BundleInstall +qall

echo "Adding personal powerline config..."

if [ -z "$XDG_CONFIG_HOME" ]; then
   XDG_CONFIG_HOME="$HOME/.config"
fi

ln -sf `pwd`/vim/powerline "$XDG_CONFIG_HOME/powerline"

echo "Done!"
