packer-templates
================

nuex's packer templates

Currently:

  * `ubuntu-14.04/base` - simple base template
  * `ubuntu-14.04/erlang` - installed erlang from Erlang Solutions public repo

## Building the box

Install Vagrant, vagrant-berkshelf plugin version 2.0.1 and VirtualBox.

    bundle exec rake build[ubuntu-14.04/base]

# Uploading

Install [s3cmd](http://s3tools.org/s3cmd) and configure your s3 credentials:

    cd ubuntu-14.04

    # Configure s3cmd
    s3cmd -c .s3cfg --configure

    # Add the bucket location to .env
    echo 'BOX_BUCKET=ultimate-boxen' > .env

    # If you're s3cmd config isn't located in .s3cfg of the current directory
    # add that to .env as well
    echo 'S3CFG="$HOME/.s3cfg-ultimate"' >> .env

    # Install the bundle
    bundle install

Upload:

    bundle exec rake upload[ubuntu-14.04/base,my.box]
