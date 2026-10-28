#!/usr/bin/env bash
set -euo pipefail
# Find security group rules that allow inbound traffic from anywhere (0.0.0.0/0).
ibmcloud is security-groups --output json | jq -r '.[] | . as $g | .rules[]? | select(.direction=="inbound" and (.remote.cidr_block? // "")=="0.0.0.0/0") | [$g.name, .protocol, (.port_min // "all" | tostring)] | @tsv'
