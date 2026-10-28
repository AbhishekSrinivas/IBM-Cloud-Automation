#!/usr/bin/env bash
set -euo pipefail
# Trigger an on-demand backup of an IBM Cloud Databases deployment and list backups.
# Usage: ./Backup-Database-Deployment.sh <deployment-name>
NAME="${1:?deployment name}"
ibmcloud cdb backup-create "$NAME" || echo "Install the plug-in with: ibmcloud plugin install cloud-databases"
ibmcloud cdb backups "$NAME"
