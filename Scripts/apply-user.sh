#!/bin/sh
pushd ~/.dotfiles
home-manager switch -f ./users/home.nix
popd