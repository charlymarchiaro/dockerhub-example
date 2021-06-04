SHA=$(git rev-parse HEAD)

kubectl \
  --kubeconfig=/dev/null \
  --server=$KUBERNETES_SERVER \
  --certificate-authority=cert.crt \
  --token=$KUBERNETES_TOKEN \
  set image k8s/deployments/dp-alpine-deployment client=charlymarchiaro/dp-alpine:$SHA