#!/bin/bash

set -o errexit

export PATH="/bin/:/usr/sbin:/usr/bin:/sbin:${PATH}"

fail()
{
    echo "FATAL: $*"
    exit 1
}

OS="$(lsb_release -s -i | tr '[A-Z]' '[a-z]')"
OSRELEASE="$(lsb_release -s -c)"

export OS
export OSRELEASE

# Set CI to true for consistent bats output
export CI=true
