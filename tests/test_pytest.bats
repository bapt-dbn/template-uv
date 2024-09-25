#!/usr/bin/env bats

load 'test_setup.bash'
load 'test_helpers.bash'

@test "Unit test check - run success case" {
    check_command_installed pytest || return 1

    run invoke test.unit
    [ "$status" -eq 0 ]
}
