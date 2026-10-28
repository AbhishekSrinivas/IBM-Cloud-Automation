#!/usr/bin/env bash
set -euo pipefail
# Capture the boot volume of a stopped VSI as a custom image via a snapshot.
# Usage: ./Create-Custom-Image-From-VSI.sh <instance-id> <image-name>
ID="${1:?instance id}"; NAME="${2:?image name}"
VOL=$(ibmcloud is instance "$ID" --output json | jq -r .boot_volume_attachment.volume.id)
ibmcloud is snapshot-create --name "$NAME-snap" --volume "$VOL"
echo "Snapshot started. Create the image from it with: ibmcloud is image-create <name> --source-volume <volume-id>"
