#!/bin/sh

pushd ~/.dotfiles
sudo nixos-rebuild switch --show-trace -I nixos-config=./system/configuration.nix
popd

