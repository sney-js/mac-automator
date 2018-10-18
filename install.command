#!/usr/bin/env bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd "$DIR"

echo "Copying files to ~/Library/Services/"
mkdir -p $HOME/Library/Services/
TOTALFILES=`ls -l *.workflow | grep -c ".workflow"`
echo "Copying $TOTALFILES ..."
cp -r *.workflow $HOME/Library/Services/ || (echo "no workflow found" && exit 1)

echo ":::::::::::::::::::::::::::::::::::::"
echo "Workflows are ready to use"
echo "Please buy Snehil Bhushan a cup of coffee :)"
echo "To get started, right click on an Image file, click Services > [your desired command]"
