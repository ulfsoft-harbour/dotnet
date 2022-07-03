ARG DOTNET_VERSION="6.0"
ARG NODE_VERSION="16"
FROM ghcr.io/ulfsoft-harbour/dotnet/sdk-vscode:${DOTNET_VERSION}

RUN curl -sL "https://deb.nodesource.com/setup_${NODE_VERSION}.x" | bash - \
    && apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    nodejs