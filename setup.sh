#!/usr/bin/env bash




# 1. Create ProgressBar function
# 1.1 Input is currentState($1) and totalState($2)
function ProgressBar {
# Process data
let _progress=(${1}*100/${2}*100)/100
let _done=(${_progress}*4)/10
let _left=40-$_done
# Build progressbar string lengths
_fill=$(printf "%${_done}s")
_empty=$(printf "%${_left}s")

# 1.2 Build progressbar strings and print the ProgressBar line
# 1.2.1 Output example:
# 1.2.1.1 Progress : [########################################] 100%
printf "\rProgress : [${_fill// /=}>${_empty// /#}] ${_progress}%%"

}


ProgressBar 1 100
if [ -z "$NVIMIDE_HOME"  ]; then
    NVIMIDE_HOME="$HOME/.nvimide"
fi

mkdir $NVIMIDE_HOME > /dev/null
pushd $NVIMIDE_HOME > /dev/null
ProgressBar 2 100

wget --no-check-certificate --content-disposition https://github.com/adrian-galbenus/nvim-as-ide/tarball/master > /dev/null


ProgressBar 4 100


popd > /dev/null


