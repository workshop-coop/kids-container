#!/usr/bin/env bash
set -e


EC_INST="vR3"


EC_URL=https://archive.eclipse.org/linuxtools/eclipse-build/eclipse-R3_5_1-fetched-src.tar.bz2
echo "EC_URL: $EC_URL"
mkdir -p "eclipse"
wget -qO- $EC_URL | tar xvj --strip 1 -C $HOME/
ln -s "$HOME" /usr/bin/eclipse

echo $HOME/.eclipse.init