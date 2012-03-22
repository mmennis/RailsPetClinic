#!/bin/bash

# Run this as root on an ubuntu-like machine to get chef-solo installed

chef_binary=which 'chef-solo'

# Are we on a vanilla system?
if ! test -f "$chef_binary"; then
    # Upgrade headlessly (this is only safe-ish on vanilla systems)
    export DEBIAN_FRONTEND=noninteractive
    aptitude update &&
    apt-get -o Dpkg::Options::="--force-confnew" --force-yes -fuy dist-upgrade &&

    # Install Ruby and Chef
    aptitude install -y ruby ruby-dev make &&
    sudo gem install --no-rdoc --no-ri chef --version 0.10.0
fi &&

"$chef_binary" -c solo.rb -j solo.json