#!/bin/bash

# Ubuntu Docker Installation Script
# This script installs Docker Engine on Ubuntu using the official repository method

# Exit immediately if a command exits with a non-zero status
set -e

echo "Updating package index..."
sudo apt-get update

echo "Installing prerequisites..."
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

echo "Adding Docker's official GPG key..."
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "Setting up Docker repository..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Updating package index with Docker repository..."
sudo apt-get update

echo "Installing Docker Engine..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

echo "Adding user $(whoami) to docker group..."
sudo usermod -aG docker $(whoami)

echo "Verifying Docker installation..."
if sudo docker run --rm hello-world | grep -q "Hello from Docker!"; then
    echo "Docker installation successful!"
else
    echo "Docker installation seems to have issues. Please check the output above."
    exit 1
fi

echo "========================================================"
echo "Docker installation complete!"
echo "You may need to log out and log back in for group changes to take effect."
echo "After logging back in, you can run Docker commands without sudo."
echo "========================================================"