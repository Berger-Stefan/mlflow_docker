FROM python:3.12-slim

# Install dependencies
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Install uv package manager
RUN curl -LsSf https://astral.sh/uv/install.sh | sh
# Install MLflow using uv
RUN /root/.local/bin/uv pip install mlflow --system

# Create mlflow_data directory with proper permissions
RUN mkdir -p /mlflow_data && chmod -R 777 /mlflow_data
RUN mkdir -p /mlflow_data/artifacts && chmod -R 777 /mlflow_data/artifacts

# Set environment variable for MLflow to run correctly
ENV PATH="/root/.local/bin:$PATH"

EXPOSE 5000

# Run MLflow with SQLite as the backend
CMD ["mlflow", "server", "--host", "0.0.0.0", "--backend-store-uri", "sqlite:////mlflow_data/mlflow.db", "--artifacts-destination", "/mlflow_data/artifacts"]

