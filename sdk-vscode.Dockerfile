ARG DOTNET_VERSION="6.0"
FROM mcr.microsoft.com/vscode/devcontainers/dotnet:6.0

RUN apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    gnupg2 ssh-client \
    2>&1 \
    ## Post installation clean up
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*