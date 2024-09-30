#!/usr/bin/env bats

load test_helper.bash
load setup_suite.bash

trap "teardown_suite" EXIT

@test "File generation check - expected files" {
    expected_files=(
        "./CHANGELOG.md"
        "./CONTRIBUTING.md"
        "./README.md"
        "./docs/changelog.md"
        "./docs/contributing.md"
        "./docs/css/material.css"
        "./docs/css/mkdocstrings.css"
        "./docs/index.md"
        "./mkdocs.yml"
        "./pyproject.toml"
        "./tasks/__init__.py"
        "./tasks/project.py"
        "./tasks/test.py"
        "./tests/__init__.py"
        "./tests/unit/__init__.py"
        "./tests/unit/test_commitizen.py"
        "./tests/unit/test_import.py"
        "./${TEST_PROJECT_NAME}/__init__.py"
        "./${TEST_PROJECT_NAME}/__init__.py"
    )

    missing_files=()

    for file in "${expected_files[@]}"; do
        if [[ ! -e "${file}" ]]; then
            missing_files+=("${file}")
        fi
    done

    if [ ${#missing_files[@]} -ne 0 ]; then
        echo "Missing expected files:"
        for file in "${missing_files[@]}"; do
            echo "${file}"
        done
        exit 1
    fi
}
