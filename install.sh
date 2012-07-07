#!/bin/sh

set -o errexit

echo "*** Installing dnsmasq..."
brew install dnsmasq

echo "*** Configurating dnsmasq..."
echo 'address=/.dev/127.0.0.1' > $(brew --prefix)/etc/dnsmasq.conf

echo "*** Installing dnsmasq into LaunchDaemons..."
sudo cp -v $(brew --prefix dnsmasq)/homebrew.mxcl.dnsmasq.plist /Library/LaunchDaemons
sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist

echo "*** Registerering .dev into /etc/resolver dnsmasq into LaunchDaemons..."
sudo mkdir -v /etc/resolver
sudo bash -c 'echo "nameserver 127.0.0.1" > /etc/resolver/dev'

echo 'Running self-check to see if .dev is working'
if ping -oc 100 'wildcard.dev' > /dev/null; then
    echo "*** Everything looks good. Enjoy the ride!"
else
    echo "*** Sorrrry. Something went wrong. Don't blame me."
fi
