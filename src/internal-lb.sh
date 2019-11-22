export ISTIO_MINOR_VERSION=1.2

export VERSION=$(curl https://raw.githubusercontent.com/knative/serving/master/third_party/istio-${ISTIO_MINOR_VERSION}-latest)

kubectl apply -f https://raw.githubusercontent.com/knative/serving/master/third_party/${VERSION}/istio-knative-extras.yaml