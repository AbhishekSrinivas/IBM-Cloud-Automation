#!/usr/bin/env bash
set -euo pipefail
# List resources in the account that have no tags.
ibmcloud resource search 'service_name:* AND -tags:*' --output json | jq -r '.items[]? | [.name,.crn] | @tsv'
