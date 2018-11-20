#!/bin/bash
kubectl apply --filename https://raw.githubusercontent.com/knative/serving/v0.2.1/third_party/istio-1.0.2/istio.yaml
kubectl label namespace default istio-injection=enabled
kubectl get pods --namespace istio-system
