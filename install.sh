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

if [ -z "$(which tmux)" ]; then 
	echo "installing tmux  for multiplexing"
	sudo apt-get install -y tmux 
fi

if [ -z "$(which ctags)" ]; then 
	echo "installing ctags for vim' plugin"
	sudo apt-get install -y ctags 
fi

if [ -z "$(which cscope)" ]; then 
	echo "installing cscope for vim' plugin"
	sudo apt-get install -y  cscope 
fi

if [ ! -f "$BASH_RC_DIR" ]; then 
	echo "file $BASH_RC_DIR is not exist"
else 

	echo "checking .bashrc .... "
	if [  -z "$TMUX_AUTO_STARTUP" ]; then 
		cat .auto_startup_tmux.conf >> $BASH_RC_DIR
		echo "$BASH_RC_DIR is updated"
	else
		echo "don't need update $BASH_RC_DIR"
	fi
fi

# install all plugin in list .vundle.vim
echo "checking plugin update ..."
vim +PluginInstall +qall
echo "update done"
