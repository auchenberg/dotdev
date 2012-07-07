devdns
======

Shell script that installs wildcard DNS for *.dev, which points to 127.0.0.1. This means you can forget all about adding entries to /etc/hosts. Awesome juice for developers.

# What's going on
This small scripts installs "dnsmasq", a lightweight DNS server, which most likely runs inside your router. It configures dnsmasq to point *.dev to 127.0.0.1, and registeres dnsmasq as a LaunchDaemon, so it start's with OSX.

Finally it hooks into Resolver in OSX, to make all traffic on *.dev use a local DNS server (dnsmasq), instead of your regular DNS. 

Bam. You just got wildcard dns (*.dev), and can now forget all about adding entries to /etc/hosts.

# Install

To install devDNS, open a terminal and run this command:

`curl https://raw.github.com/auchenberg/devdns/master/install.sh | sh`