FROM mcr.microsoft.com/cbl-mariner/base/core:2.0

RUN tdnf install -y curl git python3 ca-certificates ca-certificates-legacy

RUN ACCEPT_EULA=Y tdnf update -y && \
    # Install latest Azure CLI package. CLI team drops latest (pre-release) package here prior to public release
    # We don't support using this location elsewhere - it may be removed or updated without notice
    curl -LO https://azurecliprod.blob.core.windows.net/cloudshell-release/azure-cli-latest-mariner2.0.rpm \
    && tdnf install -y ./azure-cli-latest-mariner2.0.rpm \
    && rm azure-cli-latest-mariner2.0.rpm
