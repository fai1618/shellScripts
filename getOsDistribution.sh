#!/bin/bash
# Get Linux distribution name
get_linux_distribution() {
    if   [ -e /etc/debian_version ] ||
         [ -e /etc/debian_release ]; then
        # Check Ubuntu or Debian
        if [ -e /etc/lsb-release ]; then
            # Ubuntu
            distri_name="ubuntu"
        else
            # Debian
            distri_name="debian"
        fi
    elif [ -e /etc/fedora-release ]; then
        # Fedra
        distri_name="fedora"
    else
        # Other
        echo "unkown distribution"
        distri_name="unkown"
    fi
  }

UNAME="$(uname)"
if [ $UNAME = "Darwin" ];then
  echo "Mac"
elif [ $UNAME = "MINGW64_NT-10.0" ];then
  echo "Windows(MSYS2)"
elif [ $UNAME = "Linux" ];then
  get_linux_distribution
else
  echo echo "unkown os"
fi