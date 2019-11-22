#!/bin/bash
export PROJECT_ID={{PROJECT_ID}}
export CLUSTER_NAME="{{CLUSTER_NAME}}"
export CLUSTER_ZONE="{{CLUSTER_ZONE}}"
export INGRESS_IP={{INGRES_IP}}
export CLOUD_DNS_SA=$CLUSTER_NAME-cert-man-dns
export CLOUD_DNS_SA_EMAIL=$CLOUD_DNS_SA@$PROJECT_ID.iam.gserviceaccount.com
export LETS_ENCRYPT_EMAIL={{LETSENCRYPT_EMAIL}}
export CUSTOM_DOMAIN="{{CUSTOM_DOMAIN}}"
export SERVICE_SUBDOMAIN="{{SERVICE_SUBDOMAIN}}"
export CLOUD_DNS_ZONE="{{CLOUD_DNS_ZONE}}"
