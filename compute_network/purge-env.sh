#!/bin/bash

# Variables
RESOURCE_GROUP="az104-lab-rg"

echo "⚠️  This will delete the entire resource group: $RESOURCE_GROUP"
read -p "Type 'YES' to continue: " CONFIRM

if [ "$CONFIRM" == "YES" ]; then
  echo "🧹 Deleting resource group: $RESOURCE_GROUP ..."
  az group delete --name $RESOURCE_GROUP --yes --no-wait
  echo "✅ Deletion initiated. Check Azure Portal for progress."
else
  echo "❌ Aborted. No resources were deleted."
fi

