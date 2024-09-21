#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

echo -e "${YELLOW}### Copier generation test ###${NC}"

TEST_FOLDER_NAME=tests/temp/
COPIER_PROJECT_NAME=project/

cleanup() {
    echo -e "${YELLOW}Cleaning up ...${NC}"
    rm -rf "${TEST_FOLDER_NAME}"
}

trap 'echo -e "${RED}Error. Running cleanup.${NC}"; cleanup; exit 1' ERR

echo -e "${YELLOW}Starting copier ...${NC}"
if copier copy -f --trust -r HEAD "${COPIER_PROJECT_NAME}" "${TEST_FOLDER_NAME}" \
  -d project_name="test_template" \
  -d project_description='test_template_project_description' \
  -d author_username="bapt-dbn" \
  -d author_email="baptiste.dubin@gmail.com" \
  -d git_remote_url="https://github.com/bapt-dbn/template-uv.git"; then
    echo -e "${GREEN}Copier succeeded!${NC}"
else
    echo -e "${RED}Copier failed!${NC}"
    exit 1
fi

cleanup

echo -e "${GREEN}Test completed successfully.${NC}"

exit 0
