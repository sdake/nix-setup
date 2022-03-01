#!/usr/bin/env bash

curl -fsSL https://github.com/sdake/nix-setup/tarball/main | tar -x
cd nix-setup-*
./go.sh
