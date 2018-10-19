#!/usr/bin/env bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd "$DIR"

if [ -x "$(command -v convert)" ]; then
  echo "ImageMagick Installed!"
else
  echo "ImageMagick not found. Installing..."
  DOWNLOAD_FILE="ImageMagick-x86_64-apple-darwin17.7.0.tar.gz"
  rm "$DOWNLOAD_FILE" || echo "Cleaning.."
  curl -O https://imagemagick.org/download/binaries/$DOWNLOAD_FILE
  MAGICK_DIR_NAME=`tar -tzf $DOWNLOAD_FILE | head -1 | cut -f1 -d"/"`

  tar xvzf $DOWNLOAD_FILE

  INSTALL_DIR=$HOME/Library/ImageMagick
  echo "IMAGE MAGICK DIR NAME: $MAGICK_DIR_NAME"
  mkdir -p "$INSTALL_DIR"
  cp -r $MAGICK_DIR_NAME/ $INSTALL_DIR/
  echo "export PATH=\"$INSTALL_DIR/bin/:\$PATH\"" >> ~/.bash_profile
  echo "Finished installing Libraries"
  echo "Installing workflows"
  sleep 3
fi

echo "Copying files to $HOME/Library/Services/"
mkdir -p $HOME/Library/Services/
cp -r data/* $HOME/Library/Services/ || (echo "no workflow found" && exit 1)

echo ">>>>:::::::::::::::"
echo "Workflows are ready to use"
echo "Please buy Snehil Bhushan a cup of coffee :)"
echo "To get started, right click on an Image file, click Services > [your desired command]"
echo "<<<<<:::::::::::::::"
echo "[Exit this window now]"

exit 1;
