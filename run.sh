#!/bin/bash
set -e

echo $GCLOUD_SERVICE_KEY | base64 -d > /opt/app/gcloud-service-key.json
export GOOGLE_APPLICATION_CREDENTIALS="/opt/app/gcloud-service-key.json"
/chartmuseum \
  --port=8080 \
  --storage="google" \
  --storage-google-bucket="$GCLOUD_BUCKET_NAME" \
  --storage-google-prefix="" \
  --allow-overwrite
