#!/usr/bin/env bats

load 'test_setup.bash'
load 'test_helpers.bash'

@test "Mkdocs check - build documentation" {
    git init

    check_command_installed mkdocs || return 1

    run inv project.docs --build
    [ "$status" -eq 0 ]
}
