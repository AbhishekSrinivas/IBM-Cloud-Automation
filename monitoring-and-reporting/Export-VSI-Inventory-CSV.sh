#!/usr/bin/env bash
set -euo pipefail
# Export all VPC virtual servers to CSV.
# Usage: ./Export-VSI-Inventory-CSV.sh > vsi-inventory.csv
echo "Id,Name,Profile,Status,Zone,PrivateIp"
ibmcloud is instances --output json | jq -r '.[] | [.id,.name,.profile.name,.status,.zone.name,.primary_network_interface.primary_ip.address] | @csv'
