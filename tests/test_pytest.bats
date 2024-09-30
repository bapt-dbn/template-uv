#!/usr/bin/env bats

load test_helper.bash
load setup_suite.bash

trap "teardown_suite" EXIT

@test "Unit test check - run success case" {
    check_command_installed pytest || return 1

    run invoke test.unit
    [ "$status" -eq 0 ]
}
