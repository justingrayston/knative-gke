#!/bin/bash



echo "Creating cert-manager.yaml"

sed -e "s/{{PROJECT_ID}}/$PROJECT_ID/g" ./k8s-templates/cert-manager.yaml.tpl | \
sed -e "s/{{LETS_ENCRYPT_EMAIL}}/$LETS_ENCRYPT_EMAIL/g" \
>> ./k8s/cert-manager.yaml

echo "Creating certificate.yaml"

sed -e "s/{{CUSTOM_DOMAIN}}/$CUSTOM_DOMAIN/g" ./k8s-templates/certificate.yaml.tpl | \
sed -e "s/{{SERVICE_SUBDOMAIN}}/$SERVICE_SUBDOMAIN/g" \
>> ./k8s/certificate.yaml

echo "Creating config-domain.yaml"

sed -e "s/{{CUSTOM_DOMAIN}}/$CUSTOM_DOMAIN/g" ./k8s-templates/config-domain.yaml.tpl \
>> ./k8s/config-domain.yaml

echo "Creating ingress-gateway.yaml"

cp ./k8s-templates/ingress-gateway.yaml.tpl \
./k8s/ingress-gateway.yaml

echo "Copying remaining updated Knative config maps..."
cp ./k8s-templates/cert-manager-map.yaml ./k8s/
cp ./k8s-templates/config-network-map.yaml ./k8s/
