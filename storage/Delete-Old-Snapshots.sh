#!/usr/bin/env bash
set -euo pipefail
# Delete VPC snapshots older than N days. Dry run unless CONFIRM=yes.
# Usage: [CONFIRM=yes] ./Delete-Old-Snapshots.sh [days]
DAYS="${1:-30}"
CUTOFF=$(date -u -d "-$DAYS days" +%Y-%m-%dT%H:%M:%S)
ibmcloud is snapshots --output json | jq -r --arg c "$CUTOFF" '.[] | select(.created_at < $c) | .id' | while read -r ID; do
  [ -z "$ID" ] && continue
  if [ "${CONFIRM:-no}" = yes ]; then ibmcloud is snapshot-delete "$ID" -f; else echo "Would delete $ID"; fi
done
