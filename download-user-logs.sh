#!/bin/bash

USER_ID="005NS00000IB19hYAD"

# Input dates in Perth time (AWST)
START_DATE_PERTH="2025-05-16 00:00:00"
END_DATE_PERTH="2025-05-16 23:59:59"

# Convert Perth time to epoch seconds
START_EPOCH=$(date -j -f "%Y-%m-%d %H:%M:%S" "$START_DATE_PERTH" +"%s")
END_EPOCH=$(date -j -f "%Y-%m-%d %H:%M:%S" "$END_DATE_PERTH" +"%s")

# Subtract 8 hours (28800 seconds) to convert AWST to UTC
START_EPOCH_UTC=$((START_EPOCH - 28800))
END_EPOCH_UTC=$((END_EPOCH - 28800))

# Convert back to UTC ISO8601
START_DATE_UTC=$(date -u -r "$START_EPOCH_UTC" +"%Y-%m-%dT%H:%M:%SZ")
END_DATE_UTC=$(date -u -r "$END_EPOCH_UTC" +"%Y-%m-%dT%H:%M:%SZ")

echo "Converted UTC Start: $START_DATE_UTC"
echo "Converted UTC End:   $END_DATE_UTC"

LOG_IDS=$(sf data query --query "SELECT Id FROM ApexLog WHERE LogUserId = '$USER_ID' AND StartTime >= $START_DATE_UTC AND StartTime <= $END_DATE_UTC" --use-tooling-api --json | jq -r '.result.records[].Id')

mkdir -p logs

for ID in $LOG_IDS; do
  echo "Downloading log $ID"
  sf apex log get --log-id "$ID" --output-dir logs/
done
