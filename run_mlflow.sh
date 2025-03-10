#!/bin/bash

# Build the container
echo "Building the Docker container..."
docker build -t mlflow-tracking-server .

# Run the container
echo "Running the Docker container..."
docker run -v "$(pwd)/mlflow_data:/mlflow_data" -p 5000:5000 mlflow-tracking-server

