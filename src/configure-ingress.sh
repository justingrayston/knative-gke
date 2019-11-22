#!/usr/bin/bash
echo "Configure domain config map"
kubectl apply -f ./k8s/config-domain.yaml
echo "Configure ingress gatway"
kubectl apply -f ./k8s/ingress-gateway.yaml

echo "Patching istio-ingressgateway to static IP of $INGRESS_IP"
# kubectl apply -R -f certs_and_dns
PATCH='{"spec": { "loadBalancerIP": "'"$INGRESS_IP"'" }}'
echo $PATCH
kubectl patch svc istio-ingressgateway --namespace istio-system --patch "$PATCH"
