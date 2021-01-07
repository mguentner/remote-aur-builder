# remote yay / aur builder

Fork of https://github.com/greyltc/docker-archlinux-aur

This image allows to build package from the Archlinux User Repository (AUR)
on any host that supports the execution of docker / podman containers.

I needed this to build big packages like `ungoogled-chromium` on on-demand remote machines
that have more power than my laptop.

## usage guide

This explains how to build a **package**

* Boot the build machine, I suggest a `fedora` for the host as `podman` works here out
  of the box
* Create an archive of this repo `git archive --prefix "aur-builder/" -o master.tar HEAD`
* Copy the archive to the host `scp master.tar root@192.168.13.37:~/.`
* ssh to the host
* extract the archive, then check `install.sh` whether you need to run it, if yes do so
* run `./build.sh package` so e.g. `./build.sh ungoogled-chromium`
* wait until the build process is done, all packages can be found in `all-packages.tar`
* copy this file to your host `scp root@192.168.13.37:~/aur-builder/all-packages.tar ~/Downloads/.`
* untar and install the packages you want
* you can now shutdown the remote host
