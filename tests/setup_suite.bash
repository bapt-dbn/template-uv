#!/usr/bin/env bash

load ./test_helper.bash

RED='\033[0;31m'
YELLOW='\033[0;33m'
NC='\033[0m'

COPIER_PROJECT_NAME="${BATS_TEST_DIRNAME}/../project/"
TEST_FOLDER_NAME="${BATS_TEST_DIRNAME}/temp"
TEST_PROJECT_NAME="test_template"

setup_suite() {
    mkdir -p "${TEST_FOLDER_NAME}"

    copier_generate "${COPIER_PROJECT_NAME}" "${TEST_FOLDER_NAME}" "${TEST_PROJECT_NAME}" mkdocs "3.14"

    cd "${TEST_FOLDER_NAME}"
    activate_venv
}

teardown_suite() {
    rm -rf "${TEST_FOLDER_NAME}"
}
