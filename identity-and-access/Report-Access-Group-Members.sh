#!/usr/bin/env bash
set -euo pipefail
# Export every access group and its members.
ibmcloud iam access-groups --output json | jq -r '.[].name' | while read -r G; do
  ibmcloud iam access-group-users "$G" --output json | jq -r --arg g "$G" '.[]? | [$g,.iam_id,.email] | @tsv'
done
