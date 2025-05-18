#!/bin/bash

USER="Pritam"

# Input dates in Perth time (AWST)
START_DATE_PERTH="2025-05-18 12:40:00"
END_DATE_PERTH="2025-05-18 23:59:59"

echo "🔍 Searching for users matching name: '$USER'..."
sf data query --query "SELECT Id, Name, Username FROM User WHERE Name LIKE '%$USER%'" --use-tooling-api

# Get the first matching User ID
USER_ID=$(sf data query --query "SELECT Id FROM User WHERE Name LIKE '%$USER%'" --use-tooling-api --json | jq -r '.result.records[0].Id')

if [ -z "$USER_ID" ] || [ "$USER_ID" == "null" ]; then
  echo "❌ No matching user found for name: '$USER'"
  exit 1
fi

echo "✅ Found User ID: $USER_ID"

# Convert Perth time to epoch (seconds since 1970-01-01 UTC)
echo "🕒 Converting Perth time to UTC..."
START_EPOCH=$(date -j -f "%Y-%m-%d %H:%M:%S" "$START_DATE_PERTH" +"%s")
END_EPOCH=$(date -j -f "%Y-%m-%d %H:%M:%S" "$END_DATE_PERTH" +"%s")


# Convert epoch to UTC ISO8601 format
START_DATE_UTC=$(date -u -r "$START_EPOCH" +"%Y-%m-%dT%H:%M:%SZ")
END_DATE_UTC=$(date -u -r "$END_EPOCH" +"%Y-%m-%dT%H:%M:%SZ")

echo "🕓 UTC Start: $START_DATE_UTC"
echo "🕓 UTC End:   $END_DATE_UTC"

echo "📄 Retrieving logs between above times..."
sf data query --query "SELECT Id FROM ApexLog WHERE LogUserId = '$USER_ID' AND StartTime >= $START_DATE_UTC AND StartTime <= $END_DATE_UTC" --use-tooling-api --json

# Extract log IDs
LOG_IDS=$(sf data query --query "SELECT Id FROM ApexLog WHERE LogUserId = '$USER_ID' AND StartTime >= $START_DATE_UTC AND StartTime <= $END_DATE_UTC" --use-tooling-api --json | jq -r '.result.records[].Id')

rm -rf logs
# Create directory for logs

mkdir -p logs

# Download each log
for ID in $LOG_IDS; do
  echo "⬇️  Downloading log ID: $ID"
  sf apex log get --log-id "$ID" --output-dir logs/
done

echo "✅ All available logs downloaded to the 'logs/' directory."
