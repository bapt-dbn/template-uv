#!/usr/bin/env bats

load 'test_setup.bash'
load 'test_helpers.bash'

@test "Pre-commit check - installation and run success case" {
    git init

    check_command_installed pre-commit || return 1

    run pre-commit install
    [ "$status" -eq 0 ]

    git add -A .
    run pre-commit run --all-files
    [ "$status" -eq 0 ]
}
