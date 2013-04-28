#!/bin/sh

echo "Creating symlinks to config files..."
ln -sf `pwd`/vim/vimrc "$HOME/.vimrc"
ln -sf `pwd`/vim/gvimrc "$HOME/.gvimrc"
ln -sf `pwd`/zsh/zshrc "$HOME/.zshrc"

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

echo "Creating symlinks to vim colors..."
ln -sf `pwd`/vim/colors/* "$HOME/.vim/colors"

echo "Running :BundleInstall! from vim..."
vim +BundleInstall! +qall

echo "Modifying powerline vim theme..."

if [ -z "$XDG_CONFIG_HOME" ]; then
   XDG_CONFIG_HOME="$HOME/.config"
fi

powerline_conf_dir="$XDG_CONFIG_HOME/powerline"
mkdir -p "$powerline_conf_dir"
mkdir -p "$powerline_conf_dir/themes/vim"

for file in "$HOME/.vim/bundle/powerline/powerline/config_files/"*.json; do 
   # only allow ascii characters in the theme
   python remove_nonascii.py "$file" > "$powerline_conf_dir"/`basename "$file"` 
done

for file in "$HOME/.vim/bundle/powerline/powerline/config_files/themes/vim/"*.json; do 
   python remove_nonascii.py "$file" > "$powerline_conf_dir"/themes/vim/`basename "$file"` 
done

echo "Done!"
