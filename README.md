dev
======

DEV is a small script that installs [dnsmasq](http://www.thekelleys.org.uk/dnsmasq/doc.html), a lightweight DNS server, and configures it to point *.dev to 127.0.0.1.

Afterwards it registeres dnsmasq as a LaunchDaemon, so it start's when you boot your computer.

Lastly it hooks into Resolver in OSX, so all traffic on *.dev is piped to dnsmasq.
