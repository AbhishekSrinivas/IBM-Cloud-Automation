#!/usr/bin/env bash
set -euo pipefail
# List IBM Cloud Databases deployments (PostgreSQL, MongoDB, and so on) in the account.
ibmcloud resource service-instances --service-name databases-for-postgresql --output json | jq -r '.[] | [.name,.region_id,.state] | @tsv'
