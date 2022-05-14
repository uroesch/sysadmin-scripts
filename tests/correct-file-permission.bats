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

@test "correct-file-permission: Incomplete options --user" {
  correct-file-permission --user foo |& \
    grep -- "Missing old and/or new UID!"
}

@test "correct-file-permission: Incomplete options -u" {
  correct-file-permission -u foo |& \
    grep -- "Missing old and/or new UID!"
}

@test "correct-file-permission: Incomplete options --user --old-uid" {
  correct-file-permission --user foo --old-uid 123 |& \
    grep -- "Missing old and/or new UID!"
}

@test "correct-file-permission: Incomplete options -u -ou" {
  correct-file-permission -u foo -ou 123 |& \
    grep -- "Missing old and/or new UID!"
}

@test "correct-file-permission: Incomplete options --user --new-uid" {
  correct-file-permission --user foo --new-uid 123 |& \
    grep -- "Missing old and/or new UID!"
}

@test "correct-file-permission: Incomplete options -u -nu" {
  correct-file-permission -u foo -nu 123 |& \
    grep -- "Missing old and/or new UID!"
}
@test "correct-file-permission: Incomplete options --group" {
  correct-file-permission --group foo |& \
    grep -- "Missing old and/or new GID!"
}

@test "correct-file-permission: Incomplete options -g" {
  correct-file-permission -g foo |& \
    grep -- "Missing old and/or new GID!"
}

@test "correct-file-permission: Incomplete options --group --old-gid" {
  correct-file-permission --group foo --old-gid 123 |& \
    grep -- "Missing old and/or new GID!"
}

@test "correct-file-permission: Incomplete options -g -og" {
  correct-file-permission -g foo -og 123 |& \
    grep -- "Missing old and/or new GID!"
}

@test "correct-file-permission: Incomplete options --group --new-gid" {
  correct-file-permission --group foo --new-gid 123 |& \
    grep -- "Missing old and/or new GID!"
}

@test "correct-file-permission: Incomplete options -g -ng" {
  correct-file-permission -g foo -ng 123 |& \
    grep -- "Missing old and/or new GID!"
}

