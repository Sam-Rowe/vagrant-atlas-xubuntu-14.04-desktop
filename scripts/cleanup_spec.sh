#!/usr/bin/env bats

@test "udev rules are removed" {
  [ ! -f /etc/udev/rules.d/70-persistent-net.rules ]
}

@test "udev rules directory is created" {
  [ -d /etc/udev/rules.d/70-persistent-net.rules ]
}

@test "hidden udev directory is removed" {
  [ ! -d /dev/.udev ]
}

@test "udev net-generator rules does not exist" {
  [ ! -e /lib/udev/rules.d/75-persistent-net-generator.rules ]
}

