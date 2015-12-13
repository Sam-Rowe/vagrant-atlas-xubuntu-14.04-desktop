#!/usr/bin/env bats

@test "vagrant build time file exists" {
  [ -f "/etc/vagrant_box_build_time" ]
}

@test "vagrant user exists with correct parameters" {
  run grep vagrant /etc/passwd
  [[ "$output" == */bin/bash* ]]
}

@test "authorized keys exists with correct contents and permissions" {
  dir=/home/vagrant/.ssh
  run bash -c "ls -la $dir | grep -e ' \.$'"
  [[ "$output" == *drwx------* ]]
  [[ "$output" == *vagrant* ]]
  path=$dir/authorized_keys
  [[ -e $path ]]
  run ls -la $path
  [[ "$output" == *-rw-------* ]]
  [[ "$output" == *vagrant* ]]
  run cat $path
  [ "$output" == "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key" ]
}

@test "nfs client is installed" {
  [ -f "/sbin/mount.nfs" ]
}

