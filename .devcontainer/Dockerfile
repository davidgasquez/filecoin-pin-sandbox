FROM mcr.microsoft.com/devcontainers/base:jammy

ENV DEBIAN_FRONTEND=noninteractive

# Base tooling and dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    git \
    gnupg \
    jq \
    pkg-config \
    libssl-dev \
    unzip \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install Go (required for go-car CLI)
RUN curl -fsSL https://go.dev/dl/go1.24.0.linux-amd64.tar.gz -o /tmp/go.tar.gz \
    && tar -C /usr/local -xzf /tmp/go.tar.gz \
    && rm /tmp/go.tar.gz

ENV GOROOT=/usr/local/go
ENV GOPATH=/root/go
ENV PATH="${GOROOT}/bin:${GOPATH}/bin:${PATH}"

# Node.js 22.x from NodeSource
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key \
    | gpg --dearmor -o /usr/share/keyrings/nodesource.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/nodesource.gpg] https://deb.nodesource.com/node_22.x nodistro main" \
    > /etc/apt/sources.list.d/nodesource.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends nodejs \
    && rm -rf /var/lib/apt/lists/*

# GitHub CLI repository
RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg \
    | gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg \
    && chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
    > /etc/apt/sources.list.d/github-cli.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends gh \
    && rm -rf /var/lib/apt/lists/*

# Global npm CLIs needed for Filecoin Pin workflows
RUN npm install -g filecoin-pin ipfs-car \
    && npm cache clean --force

# Install Foundry (for the cast CLI) and surface binaries to all users
RUN curl -L https://foundry.paradigm.xyz | bash \
    && /root/.foundry/bin/foundryup \
    && install -Dm755 /root/.foundry/bin/cast /usr/local/bin/cast \
    && install -Dm755 /root/.foundry/bin/forge /usr/local/bin/forge \
    && install -Dm755 /root/.foundry/bin/anvil /usr/local/bin/anvil \
    && install -Dm755 /root/.foundry/bin/chisel /usr/local/bin/chisel \
    && install -Dm755 /root/.foundry/bin/foundryup /usr/local/bin/foundryup

ENV PATH="/usr/local/bin:${GOROOT}/bin:${GOPATH}/bin:${PATH}"

# Install go-car CLI for CAR file workflows
RUN go install github.com/ipld/go-car/cmd/car@latest

# Sanity check the installed tooling
RUN node --version \
    && npm --version \
    && filecoin-pin --version \
    && gh --version \
    && ipfs-car --version \
    && car --help >/dev/null \
    && cast --version
