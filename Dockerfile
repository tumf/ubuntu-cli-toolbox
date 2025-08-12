FROM ubuntu:24.04

# Ensure local tool installs are available on PATH
ENV PATH="/root/.local/bin:${PATH}"

# Install CLI tools and Python environment
RUN set -eux; \
    arch="$(dpkg --print-architecture)"; \
    apt-get update; \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      ca-certificates curl wget gnupg \
      # Python runtime + pipx (PEP 668 safe installs)
      python3 python3-pip python3-venv pipx \
      # Requested tools
      imagemagick ffmpeg pandoc inotify-tools file p7zip-full unrar \
      parallel rename rclone rsync tree eza jq silversearcher-ag fzf \
      bat fd-find ripgrep coreutils moreutils less vim grep sed gawk zip tar xz-utils \
    ; \
    update-ca-certificates; \
    # Install yq (mikefarah) matching CPU arch
    case "$arch" in \
      amd64) yq_arch="amd64" ;; \
      arm64) yq_arch="arm64" ;; \
      *) yq_arch="$arch" ;; \
    esac; \
    YQ_VERSION="v4.44.3"; \
    wget -O /usr/local/bin/yq "https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_${yq_arch}"; \
    chmod +x /usr/local/bin/yq; \
    # Create conventional command aliases for Debian/Ubuntu package names
    ln -sf /usr/bin/batcat /usr/local/bin/bat; \
    ln -sf /usr/bin/fdfind /usr/local/bin/fd; \
    ln -sf /usr/bin/eza /usr/local/bin/exa; \
    # Install markitdown via pipx to avoid system pip conflicts (PEP 668)
    PIPX_BIN_DIR=/usr/local/bin python3 -m pipx install --pip-args="--no-cache-dir" markitdown; \
    # Cleanup
    rm -rf /var/lib/apt/lists/*


# Install uv & playwright & aider-chat
RUN curl -LsSf https://astral.sh/uv/install.sh | sh && \
  /root/.local/bin/uv tool install playwright && \
  /root/.local/bin/playwright install --with-deps chromium && \
  /root/.local/bin/uv tool install --force --python python3.12 --with pip aider-chat@latest && \
  rm -rf /var/lib/apt/lists/*