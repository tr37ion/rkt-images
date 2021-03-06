#!/dgr/bin/busybox sh
#set -e   #cleanup can fail
. /dgr/bin/functions.sh
isLevelEnabled "debug" && set -x

# remove not needed package (build dependencies)
if pacman -Qdtq; then
  pacman -R $(pacman -Qdtq) --noconfirm
fi

# clean cache
if ! mount | grep /var/cache/pacman &> /dev/null; then
    rm -Rf /var/cache/pacman
fi
if ! mount | grep /var/lib/pacman/sync &> /dev/null; then
    rm -Rf /var/lib/pacman/sync
fi

rm -Rf /srv/* # so we can replace by links

rm -Rf /usr/share/doc/*
rm -Rf /usr/share/man/*
rm -Rf /usr/share/help/*
find /usr/share/locale/* -maxdepth 0 -type d ! -name en_US -exec rm -rf {} \;

rm -Rf /boot/*
rm -Rf /etc/udev/hwdb.bin
rm -Rf /root/.cache
