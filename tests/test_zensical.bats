#!/usr/bin/env bats

load test_helper.bash

setup() {
    ZENSICAL_TEST_FOLDER="$(mktemp -d "${BATS_TEST_DIRNAME}/temp_zensical.XXXXXX")"
}

teardown() {
    rm -rf "${ZENSICAL_TEST_FOLDER}"
}

@test "Zensical check - build documentation" {
    copier_generate "${BATS_TEST_DIRNAME}/../project/" "${ZENSICAL_TEST_FOLDER}" test_template_zensical zensical

    cd "${ZENSICAL_TEST_FOLDER}"
    activate_venv

    check_command_installed zensical || return 1

    run inv project.docs --build
    [ "$status" -eq 0 ]
}
