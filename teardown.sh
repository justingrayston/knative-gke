#!/usr/bin/bash
source ./variables.sh

gcloud container clusters delete \
 $CLUSTER_NAME --zone $CLUSTER_ZONE --project $PROJECT_ID

gcloud iam service-accounts delete $CLOUD_DNS_SA_EMAIL \
  --project $PROJECT_ID