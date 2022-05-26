#!/usr/bin/env bats

load includes
load helpers

@test "list-wwn: Common option --help" {
  list-wwn --help |& grep -- "--help"
  list-wwn --help |& grep -- "--version"
}

@test "list-wwn: Common option -h" {
  list-wwn -h |& grep -- "-h"
  list-wwn -h |& grep -- "-V"
}

@test "list-wwn: Common option --version" {
  list-wwn --version | \
    grep -w ${LIST_WWN_VERSION}
}

@test "list-wwn: Common option -V" {
  list-wwn -V | \
    grep -w ${LIST_WWN_VERSION}
}

#@test "list-wwn: Run as non-root" {
#  test::non-helpers-path
#  list-wwn /fake | \
#    grep 'This script must be run as root!'
#  test::helpers-path
#}

@test "list-wwn: Test fake mount point" {
  list-wwn /fake | \
    grep 'Did not find any WWN information;'
}
