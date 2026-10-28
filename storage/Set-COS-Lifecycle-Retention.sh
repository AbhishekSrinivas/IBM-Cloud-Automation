#!/usr/bin/env bash
set -euo pipefail
# Expire objects in an IBM Cloud Object Storage bucket after N days.
# Uses the S3-compatible API. Requires the aws CLI and HMAC credentials in a profile named "ibmcos".
# Usage: COS_ENDPOINT=https://s3.us-south.cloud-object-storage.appdomain.cloud ./Set-COS-Lifecycle-Retention.sh <bucket> [days]
BUCKET="${1:?bucket}"; DAYS="${2:-90}"
: "${COS_ENDPOINT:?set COS_ENDPOINT}"
cat > /tmp/cos-lifecycle.json <<J
{"Rules":[{"ID":"retention-${DAYS}d","Status":"Enabled","Filter":{"Prefix":""},"Expiration":{"Days":$DAYS}}]}
J
aws --profile ibmcos --endpoint-url "$COS_ENDPOINT" s3api put-bucket-lifecycle-configuration --bucket "$BUCKET" --lifecycle-configuration file:///tmp/cos-lifecycle.json
echo "Applied ${DAYS}-day retention to $BUCKET"
