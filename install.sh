#!/bin/bash 

VIM_DIR=$HOME/.vim
BASH_RC_DIR=$HOME/.bashrc

echo "installing vundle plugin"
if [ -d "$VIM_DIR/bundle/Vundle.vim" ]; then 
	echo "directory is exist, you only need clone config file"
	./sync.sh
else 
	echo "create dir"
	mkdir -p $VIM_DIR/bundle/
	git clone https://github.com/VundleVim/Vundle.vim.git $VIM_DIR/bundle/Vundle.vim
fi

if [ -z "$(which xclip)" ]; then 
	echo "installing xclip for control clipboard with tmux"
	sudo apt-get install -y xclip
fi

if [ ! -f "$BASH_RC_DIR" ]; then 
	echo "file $BASH_RC_DIR is not exist"
else 

	echo "update startup script for tmux in .bashrc"
	cat .auto_startup_tmux.conf >> $BASH_RC_DIR
fi

# install all plugin in list .vundle.vim
vim +PluginInstall +qall
