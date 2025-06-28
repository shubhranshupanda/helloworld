# Update local code from GitHub
echo "🔁 Pulling latest code from GitHub..."
git pull origin main

# Switch to Minikube Docker daemon
echo "🐳 Using Minikube Docker environment..."
eval $(minikube docker-env)

# Build Docker image
echo "🔨 Building Docker image..."
docker build --no-cache -t freetricksworld/helloworld:latest .

# Push to Docker Hub
echo "📦 Pushing image to Docker Hub..."
docker push freetricksworld/helloworld:latest

# Restart Kubernetes deployment
echo "🚀 Restarting deployment..."
kubectl rollout restart deployment mytestapp

echo "✅ Deployment updated successfully!"
