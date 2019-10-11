#!/bin/bash 

VIM_DIR=$HOME/.vim
echo "installing vundle plugin"
if [ -d "$HOME/.vim/bundle/" ]; then 
	echo "directory is exist"
else 
	echo "create dir"
	mkdir -p $HOME/.vim/bundle/
git clone https://github.com/VundleVim/Vundle.vim.git $VIM_DIR/bundle/Vundle.vim
fi


