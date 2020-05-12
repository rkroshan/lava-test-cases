#!/bin/sh

##Installation script for stress-ng

##system-update for debian/ubuntu
echo ">>>>>>>Getting system update<<<<<<<<<<<<<<"
apt-get update

##install stress-ng
echo ">>>>>>>>>>>>>>Installation stress-ng tool<<<<<<<<<<<<"
apt-get install -y stress-ng

echo ">>>>>>>>>>>>Installation Complete<<<<<<<<<<<<<<<"