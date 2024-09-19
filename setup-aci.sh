#!/bin/bash

export AZURE_RESOUCE_GROUP=suraj-aci
export AZURE_LOCATION=eastus
export AZURE_CONTAINER_GROUP=cloudshelltools

az group create \
    --name "${AZURE_RESOUCE_GROUP}" \
    --location "${AZURE_LOCATION}"

az container create \
    --resource-group "${AZURE_RESOUCE_GROUP}" \
    --name "${AZURE_CONTAINER_GROUP}" \
    --image ghcr.io/surajssd/cloudshell/tools:latest \
    --command-line "/bin/sh -c 'sleep infinity'"

az container exec -g ${AZURE_RESOUCE_GROUP} --name ${AZURE_CONTAINER_GROUP} --container-name ${AZURE_CONTAINER_GROUP} --exec-command "/bin/bash"
