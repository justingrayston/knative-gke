#!/bin/bash
# Run this as owner - correct as at serving 0.9

# Cert Manager
kubectl create namespace cert-manager
kubectl label namespace cert-manager certmanager.k8s.io/disable-validation=true
# Install the CustomResourceDefinitions and cert-manager itself
kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v0.10.0/cert-manager.yaml \
--validate=false

echo "Wait for CRD to be available..."

sleep 30

echo "Installed cert-manager now for the service account."

echo "Checking to see if account exists"

gcloud --project $PROJECT_ID iam service-accounts \
    create $CLOUD_DNS_SA \
    --display-name "Service Account to support ACME DNS-01 challenge." \

# echo "Creating DNS Zone"
# gcloud beta dns --project=$PROJECT_ID \
#     managed-zones create $CLOUD_DNS_ZONE \
#     --description="Knative cluster Public DNS" --dns-name=$CUSTOM_DOMAIN.

# gcloud beta dns --project=$PROJECT_ID \
#     managed-zones describe $CLOUD_DNS_ZONE 

# echo "^^^ Set the Nameservers with registrar, or at least make a note."
# read -rsp $'Press any key to continue...\n' -n1 key

# echo "Setting A record for $INGRESS_IP"
# gcloud dns --project=$PROJECT_ID record-sets transaction start --zone=$CLOUD_DNS_ZONE

# gcloud dns --project=$PROJECT_ID record-sets transaction add $INGRESS_IP --name=\*.$CUSTOM_DOMAIN. \
#  --ttl=300 --type=A --zone=$CLOUD_DNS_ZONE

# gcloud dns --project=$PROJECT_ID record-sets transaction execute --zone=$CLOUD_DNS_ZONE

bash ./src/dns-sa.sh
