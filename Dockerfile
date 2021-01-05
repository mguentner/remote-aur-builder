# Arch Linux base docker container with yay for AUR access
FROM greyltc/archlinux
MAINTAINER Grey Christoforo <grey@christoforo.net>

# setup aur access for a new user "docker"
ADD add-aur.sh /usr/sbin/add-aur
RUN add-aur docker
ADD build-package-docker /usr/bin/build-package
