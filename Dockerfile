# syntax=docker/dockerfile:1

FROM ubuntu:24.04

# Install ripgrep
RUN set -eux; \
    apt-get update; \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      ripgrep \
    ; \
    rm -rf /var/lib/apt/lists/*


# Install Python and markitdown
RUN set -eux; \
    apt-get update; \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      python3 \
      python3-pip \
    ; \
    python3 -m pip install --no-cache-dir markitdown; \
    rm -rf /var/lib/apt/lists/*


