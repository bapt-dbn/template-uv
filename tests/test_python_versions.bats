#!/usr/bin/env bats

load test_helper.bash
load setup_suite.bash

trap "teardown_suite" EXIT

@test "Python version support - pyproject requires-python matches minimum supported version" {
    run grep -q 'requires-python = ">=3.12"' pyproject.toml
    [ "$status" -eq 0 ]
}

@test "Python version support - GitHub Actions test matrix covers 3.12, 3.13 and 3.14" {
    run grep -q '"3.12"' .github/workflows/test.yml
    [ "$status" -eq 0 ]
    run grep -q '"3.13"' .github/workflows/test.yml
    [ "$status" -eq 0 ]
    run grep -q '"3.14"' .github/workflows/test.yml
    [ "$status" -eq 0 ]
}

@test "Python version support - GitLab CI test matrix covers 3.12, 3.13 and 3.14" {
    run grep -q '"3.12"' .gitlab-ci.yaml
    [ "$status" -eq 0 ]
    run grep -q '"3.13"' .gitlab-ci.yaml
    [ "$status" -eq 0 ]
    run grep -q '"3.14"' .gitlab-ci.yaml
    [ "$status" -eq 0 ]
}

@test "Python version support - GitLab CI test job forces UV_PYTHON to the matrix version" {
    # Without this, uv reads the pinned .python-version file before the
    # image's interpreter and every matrix job silently runs the same version.
    run grep -q 'UV_PYTHON: \$PYTHON_VERSION' .gitlab-ci.yaml
    [ "$status" -eq 0 ]
}
