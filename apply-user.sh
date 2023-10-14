#!/bin/sh

pushd ~/.dotfiles
home-manager switch -f ./users/hasibur/home.nix
popd
