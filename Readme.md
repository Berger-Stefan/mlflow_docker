# Build Container
docker build -t mlflow-tracking-server .

# Run Container
docker run -v $(pwd)/mlflow_data:/app -p 5000:5000 mlflow-tracking-server

