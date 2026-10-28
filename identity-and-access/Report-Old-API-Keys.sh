#!/usr/bin/env bash
set -euo pipefail
# List the account's API keys older than N days.
# Usage: ./Report-Old-API-Keys.sh [days]
DAYS="${1:-90}"
CUTOFF=$(date -u -d "-$DAYS days" +%Y-%m-%dT%H:%M:%S)
ibmcloud iam api-keys --all --output json | jq -r --arg c "$CUTOFF" '.[] | select(.created_at < $c) | [.name,.iam_id,.created_at] | @tsv'
