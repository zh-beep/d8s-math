#!/usr/bin/env bash

set -euxo pipefail

echo "Running linters and formatters..."

isort democritus_math/ tests/

black democritus_math/ tests/

mypy democritus_math/ tests/

pylint --fail-under 9 democritus_math/*.py

flake8 democritus_math/ tests/

bandit -r democritus_math/

# we run black again at the end to undo any odd changes made by any of the linters above
black democritus_math/ tests/
