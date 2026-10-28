#!/usr/bin/env bash
set -euo pipefail
# Install the IBM Cloud CLI and the plug-ins used by these scripts (Linux/macOS).
curl -fsSL https://clis.cloud.ibm.com/install/linux | sh
for P in vpc-infrastructure cloud-object-storage code-engine cloud-databases; do ibmcloud plugin install "$P" -f; done
echo "Log in with: ibmcloud login --sso   (or --apikey @apikey.json)"
