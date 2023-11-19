ARG DOTNET_VERSION="8.0-jammy"
FROM mcr.microsoft.com/devcontainers/dotnet:${DOTNET_VERSION}

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=${USER_UID}

RUN groupadd -f --gid ${USER_GID} ${USERNAME} \
    && useradd --uid ${USER_UID} --gid ${USER_GID} -m ${USERNAME} || true \
    && curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg \
    && echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list \
    ## Install required packages
    && apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    gnupg2 ssh-client kubectl \
    2>&1 \
    ## Post installation clean up
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

USER ${USERNAME}

## Install dotnet tools
ENV PATH="${PATH}:/home/vscode/.dotnet/tools"
RUN dotnet tool install -g dotnet-ef \
    && dotnet tool install -g dotnet-aspnet-codegenerator