#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install OPENJDK-17"
apt-get install -y openjdk-17-jdk 
apt-get clean;