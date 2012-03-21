#!/bin/bash

# Run this as root on an ubuntu-like machine to get chef-solo installed

chef_binary=/var/lib/gems/1.9.1/bin/chef-solo

# Are we on a vanilla system?
if ! test -f "$chef_binary"; then
    # Upgrade headlessly (this is only safe-ish on vanilla systems)
    export DEBIAN_FRONTEND=noninteractive
    aptitude update &&
    apt-get -o Dpkg::Options::="--force-confnew" --force-yes -fuy dist-upgrade &&

    # Install Ruby and Chef
    aptitude install -y ruby1.9.1 ruby1.9.1-dev make &&
    sudo gem1.9.1 install --no-rdoc --no-ri chef --version 0.10.0
fi &&

"$chef_binary" -c solo.rb -j solo.json