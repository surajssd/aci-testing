#!/bin/bash

export AZURE_RESOUCE_GROUP=suraj-aci
export AZURE_LOCATION=eastus
export AZURE_CONTAINER_GROUP=foobar

az group create \
    --name "${AZURE_RESOUCE_GROUP}" \
    --location "${AZURE_LOCATION}"

az container create \
    --resource-group "${AZURE_RESOUCE_GROUP}" \
    --name "${AZURE_CONTAINER_GROUP}" \
    --image quay.io/surajd/az-cli:latest \
    --command-line "/bin/sh -c 'sleep infinity'"
