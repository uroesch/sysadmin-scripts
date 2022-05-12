#!/usr/bin/env bats

load includes
load helpers

@test "correct-file-permission: Common option --help" {
  correct-file-permission --help |& grep -- "--help"
  correct-file-permission --help |& grep -- "--version"
  correct-file-permission --help |& grep -- "--user"
  correct-file-permission --help |& grep -- "--group"
  correct-file-permission --help |& grep -- "--old-uid"
  correct-file-permission --help |& grep -- "--new-uid"
  correct-file-permission --help |& grep -- "--old-gid"
  correct-file-permission --help |& grep -- "--new-gid"
}

@test "correct-file-permission: Common option -h" {
  correct-file-permission -h |& grep -- "-h"
  correct-file-permission -h |& grep -- "-V"
  correct-file-permission -h |& grep -- "-u"
  correct-file-permission -h |& grep -- "-g"
  correct-file-permission -h |& grep -- "-ou"
  correct-file-permission -h |& grep -- "-nu"
  correct-file-permission -h |& grep -- "-og"
  correct-file-permission -h |& grep -- "-ng"
}

@test "correct-file-permission: Common option --version" {
  correct-file-permission --version | \
    grep -w ${CORRECT_FILE_PERMISSION_VERSION}
}

@test "correct-file-permission: Common option -V" {
  correct-file-permission -V | \
    grep -w ${CORRECT_FILE_PERMISSION_VERSION}
}
