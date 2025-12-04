# ===================================================================
# Base: Devcontainers Python (Ubuntu + Python 3.13)
# ===================================================================
FROM mcr.microsoft.com/devcontainers/python:3.13

# ===================================================================
# System dependencies required for uv and building Python packages
# ===================================================================
RUN apt-get update && apt-get install -y \
    curl \
    build-essential \
    libssl-dev \
    libffi-dev \
    pkg-config \
    git \
    xxd \
    bc \
    hexedit \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# ===================================================================
# Install uv using official installer, then move binary to /usr/local/bin
# ===================================================================
RUN curl -LsSf https://astral.sh/uv/install.sh | sh \
    && mv /root/.local/bin/uv /usr/local/bin/uv \
    && chmod +x /usr/local/bin/uv

# ===================================================================
# Install Python kernel support for VS Code Jupyter
# ===================================================================
RUN pip install --no-cache-dir \
    ipykernel \
    ipywidgets

RUN python3 -m ipykernel install \
    --name "cryptopy" \
    --display-name "Python 3 (Crypto Dev)"
