ARG DOTNET_VERSION="7.0"
FROM ghcr.io/ulfsoft-harbour/dotnet/sdk-vscode:${DOTNET_VERSION}

ARG NODE_VERSION="18"

USER root

RUN curl -sL "https://deb.nodesource.com/setup_${NODE_VERSION}.x" | bash - \
    && curl -fsSL https://bun.sh/install | bash \
    && apt-get update \
    && apt-get install -y nodejs

USER ${USERNAME}