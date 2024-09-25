#!/usr/bin/env bats

load 'test_setup.bash'
load 'test_helpers.bash'

@test "Invoke check - basic command existence " {
    check_command_installed invoke || return 1

    run inv -l
    [ "$status" -eq 0 ]
    echo "$output" | grep -q "test.unit"
}
