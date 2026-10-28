#!/usr/bin/env bash
set -euo pipefail
# Create a VPC virtual server instance (VSI).
# Usage: VPC=<vpc-name> SUBNET=<subnet-name> KEY=<ssh-key-name> ./Create-VSI.sh <name> [zone] [profile] [image]
NAME="${1:?instance name}"; ZONE="${2:-us-south-1}"; PROFILE="${3:-bx2-2x8}"; IMAGE="${4:-ibm-ubuntu-22-04-3-minimal-amd64-1}"
: "${VPC:?set VPC}" "${SUBNET:?set SUBNET}" "${KEY:?set KEY}"
ibmcloud is instance-create "$NAME" "$VPC" "$ZONE" "$PROFILE" "$SUBNET" --image "$IMAGE" --keys "$KEY"
