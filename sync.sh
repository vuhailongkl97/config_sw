#!/bin/bash

clonning()
{
	echo "clonning"

	cp ~/.tmux.conf .
 	cp ~/.vimrc .
}
pushing()
{
	echo "pussing"

	cp .tmux.conf ~/.tmux.conf
	cp .vimrc ~/.vimrc
}

echo "clone(c) or push(p)"
read option

if [[ "$option" =~ ^c.* ]]; then 
	clonning
else 
	pushing
fi

