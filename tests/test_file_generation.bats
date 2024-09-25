#!/usr/bin/env bats

load 'test_setup.bash'

@test "File generation check - expected files" {
    expected_files=(
        "${TEST_FOLDER_NAME}/tasks/__init__.py"
        "${TEST_FOLDER_NAME}/tasks/test.py"
        "${TEST_FOLDER_NAME}/tests/__init__.py"
        "${TEST_FOLDER_NAME}/tests/unit/__init__.py"
        "${TEST_FOLDER_NAME}/tests/unit/test_commitizen.py"
        "${TEST_FOLDER_NAME}/tests/unit/test_import.py"
        "${TEST_FOLDER_NAME}/${TEST_PROJECT_NAME}/__init__.py"
        "${TEST_FOLDER_NAME}/${TEST_PROJECT_NAME}/__main__.py"
        "${TEST_FOLDER_NAME}/.cz.toml"
        "${TEST_FOLDER_NAME}/.gitignore"
        "${TEST_FOLDER_NAME}/.markdownlint-cli2.jsonc"
        "${TEST_FOLDER_NAME}/.pre-commit-config.yaml"
        "${TEST_FOLDER_NAME}/.ruff.toml"
        "${TEST_FOLDER_NAME}/CHANGELOG.md"
        "${TEST_FOLDER_NAME}/pyproject.toml"
        "${TEST_FOLDER_NAME}/README.md"
    )

    for file in "${expected_files[@]}"; do
        if [[ ! -e "${file}" ]]; then
            echo "Missing expected file: ${file}"
            exit 1
        fi
    done
}
