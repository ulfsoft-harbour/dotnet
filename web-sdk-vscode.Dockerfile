ARG DOTNET_VERSION="8.0-jammy"
FROM ghcr.io/ulfsoft-harbour/dotnet/sdk-vscode:${DOTNET_VERSION}

ARG NODE_VERSION="20"

USER root

RUN curl -sL "https://deb.nodesource.com/setup_${NODE_VERSION}.x" | bash - \
    && apt-get update \
    && apt-get install -y nodejs

USER ${USERNAME}

# Install bun.sh
RUN curl -fsSL https://bun.sh/install | bash