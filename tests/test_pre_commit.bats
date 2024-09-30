#!/usr/bin/env bats

load test_helper.bash
load setup_suite.bash

trap "teardown_suite" EXIT

@test "Pre-commit check - installation and run success case" {
    git init

    check_command_installed pre-commit || return 1

    run pre-commit install
    [ "$status" -eq 0 ]

    git add -A .
    run pre-commit run --all-files
    [ "$status" -eq 0 ]
}
