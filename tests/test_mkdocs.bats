#!/usr/bin/env bats

load test_helper.bash
load setup_suite.bash

trap "teardown_suite" EXIT

@test "Mkdocs check - build documentation" {
    git init

    check_command_installed mkdocs || return 1

    run inv project.docs --build
    [ "$status" -eq 0 ]
}
