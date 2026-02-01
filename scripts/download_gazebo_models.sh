#!/bin/bash

# Print commands as they are executed, stop the script in case of error.
set -e -x

# Move to the home folder.
cd $HOME

# Download all model archive files.
wget -l 2 -nc -r "http://models.gazebosim.org/" --accept gz

# This is the folder into which wget downloads the model archives.
cd "models.gazebosim.org"

# Extract all model archives.
for i in *
do
  tar -zvxf "$i/model.tar.gz"
done

# Delete model archives.
find . -name '*.tar.gz' | xargs rm

# Turn the download folder into the Gazebo models folder, deleting the pre-existing folder if needed.
cd ..
rm -fr "$HOME/.gazebo/models"
mkdir -p "$HOME/.gazebo"
mv "models.gazebosim.org" "$HOME/.gazebo/models"
