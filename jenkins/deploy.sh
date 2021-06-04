SHA=$(git rev-parse HEAD)

# Decrypt Kubernetes cluster certificate
echo "$KUBERNETES_CLUSTER_CERTIFICATE" | base64 --decode > cert.crt

kubectl \
  --kubeconfig=/dev/null \
  --server=$KUBERNETES_SERVER \
  --certificate-authority=cert.crt \
  --token=$KUBERNETES_TOKEN \
  delete deployment dp-alpine-deployment

kubectl \
  --kubeconfig=/dev/null \
  --server=$KUBERNETES_SERVER \
  --certificate-authority=cert.crt \
  --token=$KUBERNETES_TOKEN \
  apply -f k8s/deployments/dp-alpine-deployment.yaml