#!/bin/bash

PATH_TO_FILE="$(cd `dirname $0` && pwd)";
export		RED="[0;31m"
export		GREEN="[0;32m"
export		DEFAULT="[0;39m"

if [ -d /Applications/Hammerspoon.app ]; then
  rm -rf ~/.hammerspoon
  ln -s ${PATH_TO_FILE} ~/.hammerspoon
else
  echo "${RED}Attention: ${DEFAULT} Hammerspoon not found"
fi
