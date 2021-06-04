SHA=$(git rev-parse HEAD)

docker push charlymarchiaro/dp-alpine:latest
docker push charlymarchiaro/dp-alpine:$SHA