#!/bin/bash
kubectl apply --filename https://github.com/knative/serving/releases/download/v0.4.0/serving.yaml \
--filename https://github.com/knative/build/releases/download/v0.4.0/build.yaml \
--filename https://github.com/knative/eventing/releases/download/v0.4.0/release.yaml \
--filename https://github.com/knative/eventing-sources/releases/download/v0.4.0/release.yaml \
--filename https://github.com/knative/serving/releases/download/v0.4.0/monitoring.yaml \
--filename https://raw.githubusercontent.com/knative/serving/v0.4.0/third_party/config/build/clusterrole.yaml

kubectl apply -R -f certs_and_dns
kubectl patch svc knative-ingressgateway --namespace istio-system --patch '{"spec": { "loadBalancerIP": "35.204.177.246" }}'
