#!/usr/bin/env bats

setup() {
    RED='\033[0;31m'
    GREEN='\033[0;32m'
    YELLOW='\033[0;33m'
    NC='\033[0m'

    COPIER_PROJECT_NAME=project/
    TEST_FOLDER_NAME=$(pwd)/tests/temp
    TEST_PROJECT_NAME="test_template"

    mkdir -p "${TEST_FOLDER_NAME}"

    copier copy -f --trust -r HEAD "${COPIER_PROJECT_NAME}" "${TEST_FOLDER_NAME}" \
      -d project_name=${TEST_PROJECT_NAME} \
      -d project_description='test_template_project_description' \
      -d author_username="bapt-dbn" \
      -d author_email="baptiste.dubin@gmail.com" \
      -d git_remote_url="https://github.com/bapt-dbn/template-uv.git" \
      -d python_package_distribution_name=${TEST_PROJECT_NAME} \
      -d python_package_import_name=${TEST_PROJECT_NAME}
}

teardown() {
    echo -e "${YELLOW}Cleaning up ...${NC}"
    rm -rf "${TEST_FOLDER_NAME}"
}

trap "teardown" EXIT

@test "Generation check ..." {
    echo -e "${YELLOW}### File generation check ###${NC}"

    [ -d "${TEST_FOLDER_NAME}/test_template" ]
    [ -f "${TEST_FOLDER_NAME}/README.md" ]
    [ -f "${TEST_FOLDER_NAME}/pyproject.toml" ]
    [ -f "${TEST_FOLDER_NAME}/.ruff.toml" ]
    [ -f "${TEST_FOLDER_NAME}/.pre-commit-config.yaml" ]
    [ -f "${TEST_FOLDER_NAME}/.markdownlint-cli2.jsonc" ]
    [ -f "${TEST_FOLDER_NAME}/.gitignore" ]
    [ -f "${TEST_FOLDER_NAME}/${TEST_PROJECT_NAME}/__init__.py" ]
    [ -f "${TEST_FOLDER_NAME}/${TEST_PROJECT_NAME}/__main__.py" ]
}

@test "Pre-commit check ..." {
    echo -e "${YELLOW}### Pre-commit check ###${NC}"

    cd "${TEST_FOLDER_NAME}"
    uv venv
    uv sync
    source .venv/bin/activate
    git init

    if ! command -v pre-commit &> /dev/null; then
        echo -e "${RED}Pre-commit is not installed.${NC}"
        return 1
    fi

    run pre-commit install
    if [ "$status" -ne 0 ]; then
        echo -e "${RED}Failed to install pre-commit.${NC}"
        return 1
    fi

    git add -A .
    run pre-commit run --all-files

    if [ "$status" -eq 0 ]; then
        echo -e "${GREEN}Pre-commit hook succeeded!${NC}"
    else
        echo -e "${RED}Pre-commit hook failed!${NC}"
    fi
}

@test "Commitizen check ..." {
    echo -e "${YELLOW}### Commitizen check ###${NC}"

    cd "${TEST_FOLDER_NAME}"
    uv venv
    uv sync
    source .venv/bin/activate

    if ! command -v cz &> /dev/null; then
        echo -e "${RED}Commitizen is not installed.${NC}"
        return 1
    fi

    run cz check --message="added(feat): Empty file"
    if [ "$status" -eq 0 ]; then
        echo -e "${GREEN}Commitizen schema succeeded!${NC}"
    else
        echo -e "${RED}Commitizen schema failed!${NC}"
    fi

    run cz check --message="test wrong commit message"
    if [ "$status" -eq 1 ]; then
        echo -e "${GREEN}Commitizen check succeeded!${NC}"
    else
        echo -e "${RED}Commitizen check failed!${NC}"
    fi
}

@test "Invoke check ..." {
    echo -e "${YELLOW}### Invoke check ###${NC}"

    cd "${TEST_FOLDER_NAME}"
    uv venv
    uv sync
    source .venv/bin/activate

    if ! command -v invoke &> /dev/null; then
        echo -e "${RED}Invoke is not installed.${NC}"
        return 1
    fi

    run inv -l
    if [ "$status" -eq 0 ]; then
        echo -e "${GREEN}Invoke check succeeded!${NC}"
    else
        echo -e "${RED}Invoke check failed!${NC}"
    fi
}

@test "Unit test check ..." {
    echo -e "${YELLOW}### Unit test check ###${NC}"

    cd "${TEST_FOLDER_NAME}"
    uv venv
    uv sync
    source .venv/bin/activate

    if ! command -v pytest &> /dev/null; then
        echo -e "${RED}Pytest is not installed.${NC}"
        return 1
    fi

    run invoke test.unit
    if [ "$status" -eq 0 ]; then
        echo -e "${GREEN}Unit test check succeeded!${NC}"
    else
        echo -e "${RED}Unit test check failed!${NC}"
    fi
}
