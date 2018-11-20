#!/bin/bash
kubectl apply --filename https://github.com/knative/serving/releases/download/v0.2.1/release.yaml
kubectl apply --filename https://storage.googleapis.com/knative-releases/eventing/latest/release.yaml
kubectl apply --filename https://storage.googleapis.com/knative-releases/eventing-sources/latest/release.yaml
kubectl apply --filename https://storage.googleapis.com/knative-releases/eventing-sources/latest/release-with-gcppubsub.yaml

kubectl apply --filename config-domain.yaml
kubectl patch svc knative-ingressgateway --namespace istio-system --patch '{"spec": { "loadBalancerIP": "35.204.177.246" }}'
