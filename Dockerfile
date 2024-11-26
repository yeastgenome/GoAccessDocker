FROM ubuntu:24.04

WORKDIR /tmp

RUN DEBIAN_FRONTEND=noninteractive apt update \
    && DEBIAN_FRONTEND=noninteractive apt upgrade -y \
    && DEBIAN_FRONTEND=noninteractive apt install -y \
        curl \
        goaccess \
        unzip \
    && DEBIAN_FRONTEND=noninteractive apt purge -y \
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -rf aws \
    && rm awscliv2.zip \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp/goaccess-logs

    CMD ["sh", "-c", "/bin/bash"]
