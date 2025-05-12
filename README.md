# Spark CLI Docker

Docker container for running the Spark CLI tool.

## Prerequisites

### Installing Docker
```bash
# Make the script executable
chmod +x install-docker.sh

# Run the installation script
./install-docker.sh
```

After installation, you may need to log out and log back in for the Docker group changes to take effect.

## Usage

### Building the Docker Image

Build the Docker image using the following command:

```bash
docker build -t spark-cli .
```

### Running the Container

#### Default Mode (Mainnet)
To run the container in default mode (working on Spark mainnet):

```bash
docker run -it spark-cli
```

#### Custom Network Mode
To run the container with a specific network configuration:

```bash
# For testnet
docker run -it spark-cli yarn cli:testnet

# For mainnet (explicit)
docker run -it spark-cli yarn cli:mainnet
```

## Notes

- The container uses Node.js 18 with Yarn 4.5.0
- The Spark CLI tool is automatically built during the Docker image creation
- All necessary dependencies are included in the container