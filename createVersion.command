#!/usr/bin/env bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd "$DIR"

CURRVERSION=`cat .version`
NEWVERSION=`bc <<< $CURRVERSION+1`
echo "NEWVERSION: $NEWVERSION"
echo $NEWVERSION > .version

TARGET="../mac-image-shortcuts-v1.$NEWVERSION"
mkdir "$TARGET"
cp -r data "$TARGET/data"
cp "install.command" "$TARGET/"

zip -r -X "$TARGET.zip" "$TARGET"
