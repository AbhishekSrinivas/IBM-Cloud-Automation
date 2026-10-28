#!/usr/bin/env bash
set -euo pipefail
# Create a VPC, a subnet, and a public gateway attached to it.
# Usage: ./Create-VPC-With-Subnet.sh <name> [zone] [cidr]
NAME="${1:?name}"; ZONE="${2:-us-south-1}"; CIDR="${3:-10.240.0.0/24}"
VPC=$(ibmcloud is vpc-create "$NAME" --output json | jq -r .id)
PGW=$(ibmcloud is public-gateway-create "$NAME-pgw" "$VPC" "$ZONE" --output json | jq -r .id)
ibmcloud is subnet-create "$NAME-subnet" "$VPC" --zone "$ZONE" --ipv4-cidr-block "$CIDR" --pgw "$PGW"
