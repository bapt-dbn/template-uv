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
