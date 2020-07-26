#!/bin/bash 

VIM_DIR=$HOME/.vim
BASH_RC_DIR=$HOME/.bashrc
ZSH_RC_DIR=$HOME/.zshrc

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

if [ ! -f "$ZSH_RC_DIR" ]; then
	echo "file $ZSH_RC_DIR is not exist"
else

	echo "checking .bashrc .... "
	if [  -z "$TMUX_AUTO_STARTUP" ]; then
		cat .auto_startup_tmux.conf >> $ZSH_RC_DIR
		echo "$ZSH_RC_DIR is updated"
	else
		echo "don't need update $ZSH_RC_DIR"
	fi
fi

if [ ! -z "$(which zsh)" ]
then
    echo "zsh is installed"
else
    echo "installing zsh"
    sudo apt-get install zsh -y
fi
if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]
then
    echo "install autosugestions"
    git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
else
    echo "plugin autosugestions is installed"
fi

# install all plugin in list .vundle.vim
echo "checking plugin update ..."
vim +PluginInstall +qall
echo "update done"
