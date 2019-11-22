#!/bin/bash

# Bind the role dns.admin to this service account, so it can be used to support
# the ACME DNS01 challenge.
echo "Adding roles/dns.admin to Service Account..."
gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member serviceAccount:$CLOUD_DNS_SA_EMAIL \
    --role roles/dns.admin

# Make a temporary directory to store key
KEY_DIRECTORY=`mktemp -d`

echo "Getting keys to tmp directory..."
# Download the secret key file for your service account.
gcloud iam service-accounts keys create $KEY_DIRECTORY/cloud-dns-key.json \
    --iam-account=$CLOUD_DNS_SA_EMAIL

echo "Adding secret to cert-manager namespace..."
# Upload that as a secret in your Kubernetes cluster.
kubectl create secret --namespace cert-manager generic cloud-dns-key \
    --from-file=key.json=$KEY_DIRECTORY/cloud-dns-key.json


# Delete the local secret
rm -rf $KEY_DIRECTORY