#!/usr/bin/env bash
set -euo pipefail
# Show this month's account usage summary.
ibmcloud billing account-usage --output json | jq -r '.resources[]? | [.resource_name,.billable_cost] | @tsv' | sort -k2 -nr
