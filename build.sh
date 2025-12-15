#!/usr/bin/env bash
# Fetch the latest version of the library
fetch() {
if [ -d "rgfw" ]; then return; fi
URL1="https://github.com/ColleagueRiley/RGFW/raw/refs/heads/main/RGFW.h"
URL2="https://github.com/ColleagueRiley/RGFW/raw/refs/heads/main/XDL.h"
FILE1="${URL1##*/}"
FILE2="${URL2##*/}"

# Download the release
mkdir -p rgfw
echo "Downloading $FILE1 from $URL1 ..."
curl -L "$URL1" -o "rgfw/$FILE1"
echo "Downloading $FILE2 from $URL2 ..."
curl -L "$URL2" -o "rgfw/$FILE2"
echo ""
}


# Test the project
test() {
echo "Running 01-dx11.c ..."
clang -I. -o 01.exe examples/01-dx11.c  && ./01.exe && echo -e "\n"
# echo "Running 02-egl.c ..."
# clang -I. -o 02.exe examples/02-egl.c   && ./02.exe && echo -e "\n"
}


# Main script
if [[ "$1" == "test" ]]; then test
elif [[ "$1" == "fetch" ]]; then fetch
else echo "Usage: $0 {fetch|test}"; fi
