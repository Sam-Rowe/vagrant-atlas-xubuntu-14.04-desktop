#!/usr/bin/env bats

set -o errexit

. /tmp/common.sh

@test "curl installed" {
  run curl --version
  [ "$status" -eq 0 ]
}

@test "unzip installed" {
  run unzip --version
  [ "$status" -eq 10 ]
}

@test "setup sudo" {
  run grep vagrant /etc/sudoers.d/vagrant
  [ "$output" = "vagrant ALL=NOPASSWD:ALL" ]
}

@test "UseDNS set to no" {
  run grep UseDNS /etc/ssh/sshd_config
  [ "$output" = "UseDNS no" ]
}

@test "Configure Grub" {
  run cat /etc/default/grub
  [[ "$output" == *GRUB_DEFAULT=0* ]]
  [[ "$output" == *GRUB_TIMEOUT=0* ]]
}

