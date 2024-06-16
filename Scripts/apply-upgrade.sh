#!/bin/sh
pushd ~/.dotfiles
sudo nixos-rebuild switch --upgrade -I nixos-config=./system/configuration.nix
popd
