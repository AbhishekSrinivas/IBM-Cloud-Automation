#!/usr/bin/env bash
set -euo pipefail
# List block storage volumes that are not attached to any instance.
ibmcloud is volumes --output json | jq -r '.[] | select((.volume_attachments | length) == 0) | [.id,.name,.capacity,.profile.name,.created_at] | @tsv'
