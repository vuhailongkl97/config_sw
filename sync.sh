#!/bin/bash

clonning()
{
	echo "clonning"

	cp -v .tmux.conf ~/
	cp -v .vimrc ~/

	cp -v .cscope_maps.vim ~/
	cp -v .vundle.vim ~/
	cp -v .taglist.vim ~/
	cp -v .srcexpl.vim ~/
}
pushing()
{
	echo "pussing"

	cp -v  ~/.tmux.conf .
 	cp -v  ~/.vimrc .

	cp -v ~/.cscope_maps.vim .
	cp -v ~/.vundle.vim .
	cp -v ~/.taglist.vim .
	cp -v  ~/.srcexpl.vim .
}

echo "clone from repo(c) or push to repo(p)"
read option

if [[ "$option" =~ ^c.* ]]; then 
	clonning
else 
	pushing
fi

