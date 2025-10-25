#!/bin/bash

# Load environment variables from .env file
if [ -f .env ]; then
  export $(grep -v '^#' .env | xargs)
fi

# Get current value
current=$(az apim nv show \
  --resource-group core \
  --service-name "$APIM_SERVICE_NAME" \
  --named-value-id doc-active-backend \
  --query value -o tsv)

# Toggle between doc-north and doc-west
if [ "$current" = "doc-north" ]; then
  new_value="doc-west"
else
  new_value="doc-north"
fi

echo "Switching from $current to $new_value"

# Update the named value
az apim nv update \
  --resource-group core \
  --service-name "$APIM_SERVICE_NAME" \
  --named-value-id doc-active-backend \
  --value "$new_value"

echo "Successfully switched to $new_value"