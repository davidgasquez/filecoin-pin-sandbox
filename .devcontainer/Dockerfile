FROM mcr.microsoft.com/devcontainers/base:jammy

# Install git and build essentials needed for building pdptool
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends git build-essential golang-go \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Go
RUN wget "https://golang.org/dl/go1.23.7.linux-amd64.tar.gz" -O /tmp/go.tar.gz \
    && tar -C /usr/local -xzf /tmp/go.tar.gz \
    && rm /tmp/go.tar.gz
ENV PATH="/usr/local/go/bin:${PATH}"

# Install pdptool
RUN git clone https://github.com/filecoin-project/curio.git /tmp/curio \
    && cd /tmp/curio && cd cmd/pdptool && go build . \
    && mkdir -p /usr/local/bin \
    && cp /tmp/curio/cmd/pdptool/pdptool /usr/local/bin/ \
    && rm -rf /tmp/curio
