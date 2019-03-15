#!/bin/bash

fileDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
cd $fileDir

source $fileDir/svg-to-png.sh

addSvg2pngCommand "$fileDir/../SVG" "SwitchCameraIcon.svg" "$fileDir/../Icons.xcassets/SwitchCameraIcon.imageset" "60:1,2,3" false

inkscape --shell < commands.txt
rm ./commands.txt
