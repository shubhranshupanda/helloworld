#!/bin/bash

# Switch to Minikube's Docker daemon
eval $(minikube docker-env)

# Build Docker image
docker build --no-cache -t freetricksworld/helloworld:latest .

#update to docker hub
docker push freetricksworld/helloworld:latest

# Restart the Kubernetes deployment
kubectl rollout restart deployment mytestapp

echo "✅ Deployment updated successfully!"
