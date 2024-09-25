#!/usr/bin/env bats

load 'test_setup.bash'
load 'test_helpers.bash'

@test "Commitizen check - correct commit message" {
    check_command_installed cz || return 1

    run cz check --message="added(feat): Empty file"
    [ "$status" -eq 0 ]
}

@test "Commitizen check - incorrect commit message" {
    check_command_installed cz || return 1

    run cz check --message="test wrong commit message"
    [ "$status" -ne 0 ]
}
