#!/usr/bin/env bash
set -euo pipefail
# Change the profile (size) of a VSI. The instance must be stopped first.
# Usage: ./Resize-VSI.sh <instance-id> <new-profile>
ID="${1:?instance id}"; PROFILE="${2:?new profile, e.g. bx2-4x16}"
ibmcloud is instance-stop "$ID" -f
until [ "$(ibmcloud is instance "$ID" --output json | jq -r .status)" = stopped ]; do sleep 10; done
ibmcloud is instance-update "$ID" --profile "$PROFILE"
ibmcloud is instance-start "$ID"
