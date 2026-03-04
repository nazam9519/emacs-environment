#!/usr/local/bin/bash

DIRC="$(pwd)/../src"
ED=.emacs.d
mkdir ~/$ED
if [ $? -ne 0 ]; then 
   echo "nvm"
   exit 1
fi
cp -r $DIRC/../src/* ~/$ED
cp -r $DIRC/../src/.config ~/$ED
echo "copied them all ober"
