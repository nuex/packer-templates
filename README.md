packer-templates
================

nuex's packer templates

Currently:

  * `ubuntu-14.04-amd64-base` - simple base template

## Building the box

Install Vagrant, vagrant-berkshelf plugin version 2.0.1 and VirtualBox.

    cd ubuntu-14.04
    rake build[ubuntu-14.04-amd64-base]
