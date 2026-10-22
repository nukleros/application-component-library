set -e

NAMESPACE=$(sed -n 's/^namespace: *//p' .source/database/values.yaml)

kubectl create ns ${NAMESPACE} --dry-run=client -o yaml | kubectl apply -f -
kubectl apply -f database/zalando-postgres/
