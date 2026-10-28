#!/usr/bin/env bash
set -euo pipefail
# Sync a local folder to an IBM Cloud Object Storage bucket (S3-compatible API).
# Usage: COS_ENDPOINT=<endpoint> ./Backup-Folder-To-COS.sh <local-folder> <bucket> [prefix]
SRC="${1:?local folder}"; BUCKET="${2:?bucket}"; PREFIX="${3:-backups/$(hostname)}"
: "${COS_ENDPOINT:?set COS_ENDPOINT}"
aws --profile ibmcos --endpoint-url "$COS_ENDPOINT" s3 sync "$SRC" "s3://$BUCKET/$PREFIX" --only-show-errors
