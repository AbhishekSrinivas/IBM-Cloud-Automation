#!/usr/bin/env bash
set -euo pipefail
# Start or stop every VSI that carries a user tag.
# Usage: ./Start-Stop-VSI-By-Tag.sh <start|stop> [tag]
ACTION="${1:?start or stop}"; TAG="${2:-schedule:office-hours}"
ibmcloud is instances --output json | jq -r --arg t "$TAG" '.[] | select((.tags // []) | index($t)) | .id' | while read -r ID; do
  [ -z "$ID" ] && continue
  case "$ACTION" in
    start|stop) echo "$ACTION $ID"; ibmcloud is instance-$ACTION "$ID" -f ;;
    *) echo "Unknown action $ACTION" >&2; exit 1 ;;
  esac
done
