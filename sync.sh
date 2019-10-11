#!/bin/bash

clonning()
{
	echo "clonning"

	cp .tmux.conf ~/
	cp .vimrc ~/

	cp .cscope_maps.vim ~/
	cp .vundle.vim ~/
	cp .taglist.vim ~/

}
pushing()
{
	echo "pussing"

	cp ~/.tmux.conf .
 	cp ~/.vimrc .

	cp ~/ .cscope_maps.vim 
	cp ~/ .vundle.vim
	cp  ~/ .taglist.vim

}

echo "clone from repo(c) or push to repo(p)"
read option

if [[ "$option" =~ ^c.* ]]; then 
	clonning
else 
	pushing
fi

