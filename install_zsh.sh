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
