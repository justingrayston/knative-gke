#!/bin/bash

# Currently Skipped using Istio add-on for GKE
kubectl apply --filename https://github.com/knative/serving/releases/download/v0.4.0/istio-crds.yaml
sleep 30
kubectl apply --filename https://github.com/knative/serving/releases/download/v0.4.0/istio.yaml

kubectl label namespace default istio-injection=enabled
kubectl get pods --namespace istio-system
