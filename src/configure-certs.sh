#!/usr/bin/bash
echo "Giving a bit more time for CRDs..."

sleep 30 
echo "Configuring certs for services..."


kubectl apply -f ./k8s/cert-manager.yaml
kubectl get clusterissuer --namespace cert-manager \
 letsencrypt-issuer --output yaml --watch


sleep 10
kubectl apply -f ./k8s/certificate.yaml
sleep 5
echo "Watch for changes in certificate status..."

kubectl get certificate --namespace istio-system \
 my-certificate --output yaml --watch