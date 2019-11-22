#!/usr/bin/bash

gcloud services enable \
     cloudapis.googleapis.com \
     container.googleapis.com \
     containerregistry.googleapis.com \
     dns.googleapis.com


gcloud beta container clusters create $CLUSTER_NAME \
  --addons=HorizontalPodAutoscaling,HttpLoadBalancing,Istio \
  --machine-type=n1-standard-4 \
  --cluster-version=latest --zone=$CLUSTER_ZONE \
  --enable-stackdriver-kubernetes --enable-ip-alias \
  --enable-autoscaling --min-nodes=2 --max-nodes=10 \
  --enable-autorepair \
  --enable-autoprovisioning --min-cpu 1 --max-cpu 4 --min-memory 1 \
  --max-memory 16 \
  --scopes cloud-platform

echo "Getting credentials for kubeconfig..."

gcloud container clusters get-credentials $CLUSTER_NAME \
 --zone=$CLUSTER_ZONE

echo "Set cluster admin role..."

kubectl create clusterrolebinding cluster-admin-binding \
--clusterrole=cluster-admin \
--user=$(gcloud config get-value core/account)



