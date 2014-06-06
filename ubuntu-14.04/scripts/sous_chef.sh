#!/bin/bash -x

set -e

# Updating and Upgrading dependencies
sudo apt-get update -y
sudo apt-get upgrade -y

# Install necessary dependencies
sudo apt-get -y install curl wget git tmux xvfb vim gettext libcurl4-gnutls-dev libexpat1-dev libxslt-dev libxml2-dev
