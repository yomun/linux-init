#!/bin/bash

#
# VERSION : 0.2
# AUTHOR : Davide Airaghi
#
# Script to create a portable version of Mozilla Firefox ESR
# to be used on a generic GNU/Linux System.
#
# if you run "bash firefox-portable.sh"     you get a portable version for the latest version of Firefox "standard"
# if you run "bash firefox-portable.sh esr" you get a portable version for the latest version of Firefox "ESR"
#
# Changelog
# - 0.2 : fixed a bug
# - 0.1 : initial release

# MacOS :         https://download.mozilla.org/?product=firefox-esr-latest&os=osx&lang=en-US
# Windows 64bit : https://download.mozilla.org/?product=firefox-esr-latest&os=win64&lang=en-US
# Linux 64bit :   https://download.mozilla.org/?product=firefox-esr-latest&os=linux64&lang=en-US
# Linux 32bit :   https://download.mozilla.org/?product=firefox-esr-latest&os=linux&lang=en-US

if [ "$ARCH" = "" ]; then
	ARCH=$( uname -m 2>/dev/null )
fi

if [ "$OS" = "" ]; then
	OS=$(uname -o 2>/dev/null || uname -s 2>/dev/null)
fi

FOXVER=$1

if [ "$FOXVER" != "esr" ]; then
	FOXVER=""
else	
	FOXVER="-esr"
fi


FSYS=""
FVER=""

case "$OS" in
    GNU/Linux)
		FSYS="linux"
		;;
    *) 
		echo "Unsupported OS"
		exit 1
		;;
esac

case "$FSYS" in
    linux)
		if [ "$ARCH" = "x86_64" ]; then
			FVER="64"
		fi
		;;
	*)	
		;;
esac

cd /tmp
wget "https://download.mozilla.org/?product=firefox${FOXVER}-latest&os=${FSYS}${FVER}&lang=en-US" -O firefox.tar.bz2

mkdir firefox${FOXVER}-portable
cd firefox${FOXVER}-portable
tar xvjf ../firefox.tar.bz2

mv firefox app

mkdir app/plugins
[ -e /usr/lib64/IcedTeaPlugin.so ] && ln -s /usr/lib64/IcedTeaPlugin.so app/plugins/IcedTeaPlugin.so
[ -e /usr/lib/IcedTeaPlugin.so ] && ln -s /usr/lib/IcedTeaPlugin.so app/plugins/IcedTeaPlugin.so
ln -s app/plugins/ plugins

mkdir data
cd data
ln -s ../app/plugins/ plugins
cd ..

echo '#!/bin/sh' > "firefox-portable"
echo 'dir=${0%/*}' >> "firefox-portable"
echo 'if [ "$dir" = "$0" ]; then' >> "firefox-portable"
echo '  dir="."' >> "firefox-portable"
echo 'fi' >> "firefox-portable"
echo 'cd "$dir/app"' >> "firefox-portable"
echo './firefox --new-instance --profile ../data' >> "firefox-portable"

chmod +x "firefox-portable"