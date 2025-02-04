# Use Ubuntu as the base image
FROM ubuntu:22.04

# Set the working directory
WORKDIR /src

# Install necessary system dependencies
RUN apt update && apt install -y python3 python3-venv python3-pip && rm -rf /var/lib/apt/lists/*

# Create and activate a virtual environment
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

COPY . .

# Upgrade pip
RUN pip install -e .

# Run the application
CMD ["bash", "-c", "PYTHONPATH=src python3 src/app/__init__.py"]