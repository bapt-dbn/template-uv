#!/usr/bin/env bash

load ./test_helper.bash

RED='\033[0;31m'
YELLOW='\033[0;33m'
NC='\033[0m'

COPIER_PROJECT_NAME=project/
TEST_FOLDER_NAME=./tests/temp
TEST_PROJECT_NAME="test_template"

setup_suite() {
    mkdir -p "${TEST_FOLDER_NAME}"

    copier copy -f --trust -r HEAD "${COPIER_PROJECT_NAME}" "${TEST_FOLDER_NAME}" \
      -d project_name=${TEST_PROJECT_NAME} \
      -d project_description='test_template_project_description' \
      -d author_username="bapt-dbn" \
      -d author_email="baptiste.dubin@gmail.com" \
      -d git_remote_url="https://github.com/bapt-dbn/template-uv.git" \
      -d python_package_distribution_name=${TEST_PROJECT_NAME} \
      -d python_package_import_name=${TEST_PROJECT_NAME}

    cd "${TEST_FOLDER_NAME}"
    activate_venv
}

teardown_suite() {
    echo -e "${YELLOW}Cleaning up ...${NC}"
    rm -rf "${TEST_FOLDER_NAME}"
}
