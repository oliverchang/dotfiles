#!/bin/sh

echo "Creating symlinks to config files..."
ln -sf `pwd`/vim/vimrc "$HOME/.vimrc"
ln -sf `pwd`/vim/gvimrc "$HOME/.gvimrc"
ln -sf `pwd`/zsh/zshrc "$HOME/.zshrc"
ln -sf `pwd`/ycm_extra_conf.py "$HOME/.vim/ycm_extra_conf.py"

ln -sf `pwd`/tmux/tmux.conf "$HOME/.tmux.conf"

if [ `uname` = "Darwin" ]; then
   # Fix copy/paste for OSX in tmux
   echo "Creating a symlink to a tmux copy/paste fix for OSX..."
   ln -sf `pwd`/tmux/tmux.conf.osx "$HOME/.tmux.conf.osx"
else
   echo '' > "$HOME/.tmux.conf.osx"
fi

echo "Creating .vim folder..."
mkdir -p "$HOME/.vim"
mkdir -p "$HOME/.vim/colors"
mkdir -p "$HOME/.vim/bundle"

if [ ! -d "$HOME/.vim/bundle/vundle" ]; then
   echo "Installing vundle..."
   git clone git://github.com/gmarik/vundle.git "$HOME/.vim/bundle/vundle"
fi

mkdir -p ~/.config/nvim
ln -s `pwd`/init.vim ~/.config/nvim/init.vim

echo "Running :BundleInstall! from vim..."
vim +BundleInstall! +qall

echo "Done!"
