php-slave
=========
The goal of this is to provide a simple PHP development machine. That can be upgraded with chef and vagrant. A www folder next to the php-slave folder will be shared with the virtual machine and is supposed to contain the content of the application you are trying to run. It will be mounted into the /var/www/ folder of the virtual machine.

### Pre-Installation
Local setup for virtualization

* Install Ruby (with RVM: https://rvm.io/rvm/install)
* Install VirtualBox (https://www.virtualbox.org/wiki/Downloads)
* Install Vagrant (http://www.vagrantup.com/downloads)
* Install librarian-chef:
```sh
$ gem install librarian-chef
```
* Install Vagrant omnibus plugin:
```sh
$ vagrant plugin install vagrant-omnibus
```
* Install Vagrant librarian chef plugin:
```sh
$ vagrant plugin install vagrant-librarian-chef
```
If it fails with something among the lines of *unhandled exception from extconf.rb* it either means you don't have `make` or `gcc`.
or the way to fix it is as described [in this thread](http://stackoverflow.com/questions/26537810/ruby-error-on-os-x-yosemite-and-chef) - meaning:
```sh
sudo ARCHFLAGS=-Wno-error=unused-command-line-argument-hard-error-in-future vagrant plugin install vagrant-librarian-chef
```

* Install Vagrant automatic guest addition update
```sh
$ vagrant plugin install vagrant-vbguest
```
* Make sure your ssh public key is connected to your github account (https://help.github.com/articles/generating-ssh-keys/) Enter it on https://github.com/settings/ssh

### Installation
Checkout this repository and place another www folder next to the one created.

### Access
There is only one vhost configured that is accessible through a port forward on http://localhost:8080 on your own machine.

### Different Environments
To create an environment which has a database available please create another branch and try to name it as meaningful as possible.
