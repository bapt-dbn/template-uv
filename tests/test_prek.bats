#!/usr/bin/env bats

load test_helper.bash

setup() {
    PREK_TEST_FOLDER="$(mktemp -d "${BATS_TEST_DIRNAME}/temp_prek.XXXXXX")"
}

teardown() {
    rm -rf "${PREK_TEST_FOLDER}"
}

@test "Prek check - installation and run success case" {
    copier_generate "${PREK_TEST_FOLDER}" test_template_prek prek

    cd "${PREK_TEST_FOLDER}"
    activate_venv
    git init

    check_command_installed prek || return 1

    run prek install
    [ "$status" -eq 0 ]

    git add -A .
    run prek run --all-files
    [ "$status" -eq 0 ]
}
