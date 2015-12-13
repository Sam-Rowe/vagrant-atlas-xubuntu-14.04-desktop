#!/usr/bin/env bats

@test "empty file is removed" {
  [ ! -e /EMPTY ]
}
