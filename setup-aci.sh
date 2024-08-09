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
    --image quay.io/surajd/cloudshell-tools:master-e060fc5-2024-08-Aug-09-07-46-19 \
    --command-line "/bin/sh -c 'sleep infinity'"

az container exec -g ${AZURE_RESOUCE_GROUP} --name ${AZURE_CONTAINER_GROUP} --container-name cloudshelltools --exec-command "/bin/bash"
