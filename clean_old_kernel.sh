#!/usr/bin/env bash

# clean installed kernel, except the current one.


CURRENT=$(uname -r | /bin/grep -oE '^[0-9]+.[0-9]+.[0-9]+\-[0-9]+')

/usr/bin/dpkg -l | /bin/grep "ii  linux-\(headers\|image\)" | /bin/grep -v $CURRENT | /usr/bin/awk '{print $2}' | /usr/bin/xargs /usr/bin/apt-get purge -y
