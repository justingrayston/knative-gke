#!/usr/bin/bash
source ./variables.sh

mkdir -p k8s/
echo "Clearing old files, if they exist."
rm -f k8s/*.yaml
echo "Starting set up..."

bash ./src/create-yaml.sh
bash ./src/cluster.sh
bash ./src/knative.sh
bash ./src/internal-lb.sh
bash ./src/create-cert-manager.sh
bash ./src/configure-ingress.sh
bash ./src/configure-certs.sh
