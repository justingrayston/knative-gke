#!/usr/bin/bash
export CLUSTER_NAME="knative-prod"
export CLUSTER_ZONE="europe-west4-a"

gcloud container clusters create $CLUSTER_NAME  \
 --zone=$CLUSTER_ZONE   --cluster-version=1.10.9-gke.5  \
--machine-type=n1-standard-4   --enable-autoscaling \
--min-nodes=1 --max-nodes=10   --enable-autorepair \
--scopes=service-control,service-management,compute-rw,storage-ro,cloud-platform,logging-write,monitoring-write,pubsub,datastore \
--num-nodes=3

kubectl create clusterrolebinding cluster-admin-binding \
--clusterrole=cluster-admin \
--user=$(gcloud config get-value core/account)

kubectl apply --filename https://raw.githubusercontent.com/jetstack/cert-manager/release-0.6.1/contrib/manifests/cert-manager/with-rbac.yaml

