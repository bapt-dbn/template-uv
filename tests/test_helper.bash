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
  local src="$1" dst="$2" name="$3" docs_tool="$4" python_version="${5:-3.14}"
  copier copy -f --trust "${src}" "${dst}" \
    -d project_name="${name}" \
    -d project_description='test_template_project_description' \
    -d author_username="bapt-dbn" \
    -d author_email="baptiste.dubin@gmail.com" \
    -d git_remote_url="https://github.com/bapt-dbn/template-uv.git" \
    -d python_package_distribution_name="${name}" \
    -d python_package_import_name="${name}" \
    -d docs_tool="${docs_tool}" \
    -d python_version="${python_version}"
}
