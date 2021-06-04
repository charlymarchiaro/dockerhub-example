SHA=$(git rev-parse HEAD)

# Decrypt Kubernetes cluster certificate
echo "$KUBERNETES_CLUSTER_CERTIFICATE" | base64 --decode > cert.crt

kubectl \
  --kubeconfig=/dev/null \
  --server=$KUBERNETES_SERVER \
  --certificate-authority=cert.crt \
  --token=$KUBERNETES_TOKEN \
  set image deployments/dp-alpine-deployment dp-alpine=charlymarchiaro/dp-alpine:$SHA