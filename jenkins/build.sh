SHA=$(git rev-parse HEAD)

docker build -t charlymarchiaro/dp-alpine:latest -t charlymarchiaro/dp-alpine:$SHA .