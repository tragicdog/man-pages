#!/bin/bash

if [ -f /usr/local/bin/bbedit ] ; then

  MANTEXT=/Users/username/man

  if [ -f $MANTEXT/$1.txt ] ; then
    bbedit $MANTEXT/$1.txt
  else
    man $1 | col -b > $MANTEXT/$1.txt
    if [ -f /Developer/Tools/SetFile ] ; then
      /Developer/Tools/SetFile -c R*ch $MANTEXT/$1.txt
    fi
    bbedit $MANTEXT/$1.txt
  fi
else
  echo "BBEdit is not installed!"
fi