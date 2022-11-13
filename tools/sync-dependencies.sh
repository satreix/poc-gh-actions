#!/bin/bash
set -eufo pipefail

github::set_output() {
    local name="$1"
    local value="$2"
    if [ -z ${GITHUB_OUTPUT+x} ]; then
        echo "::set-output name=${name} value=${value}";
    else
        echo "${name}=${value}" >> $GITHUB_OUTPUT;
    fi
}

cp deps.txt third_party/deps-derived.txt

echo "---" >&2
echo "Sync changes:" >&2
git --no-pager diff --no-ext-diff
echo "---" >&2

if [ ! $(git diff-files --quiet) ]; then
    github::set_output "changes_detected" "true"
else
    github::set_output "changes_detected" "false"
fi
