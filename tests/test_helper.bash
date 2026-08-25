#!/usr/bin/env bash

# Helpers for checking installed commands
check_command_installed() {
  if ! command -v "$1" &> /dev/null; then
    echo -e "${RED}$1 is not installed.${NC}"
    return 1
  fi
}

# Helper for activating virtual environment
activate_venv() {
  uv venv
  uv sync
  source .venv/bin/activate
}

copier_generate() {
  local dst="$1" name="$2" pre_commit_tool="${3:-pre-commit}"
  copier copy -f --trust -r HEAD "${BATS_TEST_DIRNAME}/../project/" "${dst}" \
    -d project_name="${name}" \
    -d project_description='test_template_project_description' \
    -d author_username="bapt-dbn" \
    -d author_email="baptiste.dubin@gmail.com" \
    -d git_remote_url="https://github.com/bapt-dbn/template-uv.git" \
    -d python_package_distribution_name="${name}" \
    -d python_package_import_name="${name}" \
    -d python_version="3.14" \
    -d pre_commit_tool="${pre_commit_tool}"
}
