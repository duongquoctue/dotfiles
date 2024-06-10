#!/bin/zsh

# make all .sh files executable
chmod -R +x *.sh
./install/shared/setup.sh

if [[ "$OSTYPE" == "darwin"* ]];
then
    ./install/macos/setup.sh
    ./install/macos/after.sh
elif [[ "$OSTYPE" == "linux-gnu"* ]]; # will be updated soon
then
    ./install/linux/setup.sh
fi
