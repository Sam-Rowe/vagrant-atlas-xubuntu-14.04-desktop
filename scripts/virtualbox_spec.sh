#!/usr/bin/env bats

@test "VirtualBox init script exists" {
  [ -f /etc/init.d/vboxadd ]
}
