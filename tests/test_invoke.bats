#!/usr/bin/env bats

load test_helper.bash
load setup_suite.bash

trap "teardown_suite" EXIT

@test "Invoke check - basic command existence " {
    check_command_installed invoke || return 1

    run inv -l
    [ "$status" -eq 0 ]
    echo "$output" | grep -q "test.unit"
}
