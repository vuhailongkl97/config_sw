#!/bin/bash 

VIM_DIR=$HOME/.vim
BASH_RC_DIR=$HOME/.bashrc
ZSH_RC_DIR=$HOME/.zshrc

printf  "enter install cmd :\n
   ex: sudo apt-get install\n
   ex: sudo yum install\n"

read INSTALL_CMD

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
	$INSTALL_CMD -y xclip
fi

if [ -z "$(which tmux)" ]; then 
	echo "installing tmux  for multiplexing"
	$INSTALL_CMD -y tmux
fi

if [ -z "$(which ctags)" ]; then 
	echo "installing ctags for vim' plugin"
	$INSTALL_CMD -y ctags
fi

if [ -z "$(which cscope)" ]; then 
	echo "installing cscope for vim' plugin"
	$INSTALL_CMD -y  cscope
fi

if [ ! -z "$(which zsh)" ]
then
    echo "zsh is installed"
else
    echo "installing zsh"
    $INSTALL_CMD zsh -y
fi

if [ ! -z "$(which zsh)" ]
then
    echo "zsh is installed"
else
    echo "installing zsh"
    $INSTALL_CMD zsh -y
fi

if [ ! -d ~/.oh-my-zsh ]
then
    echo "install oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "plugin oh-my-zsh is installed"
fi

if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]
then
    echo "install autosugestions"
    git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
else
    echo "plugin autosugestions is installed"
fi

if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]
then
    echo "install syntax hightlighting"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
else
    echo "plugin syntax highlighting is installed"
fi


# install all plugin in list .vundle.vim
echo "checking plugin update ..."
vim +PluginInstall +qall
echo "update done"
