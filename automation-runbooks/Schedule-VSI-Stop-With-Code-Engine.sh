#!/usr/bin/env bash
set -euo pipefail
# Run a Code Engine job on a cron schedule (for example a nightly stop script packaged as an image).
# Usage: PROJECT=<ce-project> IMAGE=<registry/image:tag> ./Schedule-VSI-Stop-With-Code-Engine.sh [cron]
: "${PROJECT:?set PROJECT}" "${IMAGE:?set IMAGE}"
CRON="${1:-0 19 * * 1-5}"
ibmcloud ce project select --name "$PROJECT"
ibmcloud ce job create --name stop-tagged-vsis --image "$IMAGE"
ibmcloud ce subscription cron create --name stop-tagged-vsis-nightly --destination-type job --destination stop-tagged-vsis --schedule "$CRON"
