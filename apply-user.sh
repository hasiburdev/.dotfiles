#!/bin/sh

pushd ~/.dotfiles
nix build .#homeManagerConfigurations.hasibur.activationPackage
./result/activate
popd
