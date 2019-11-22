# knative-gke

This is a really naive way of creating a GKE cluster and condensing the GKE instructions from [knative.dev](https://knative.dev)

It uses bash, not terraform or Deployment Manager as this requires the least set and install for anyone. It isn't without issue, but I have found it very useful for spinning up a knative environment and then tearing it down again.

Perhaps in the future there maybe a more robust deployment. PRs welcome, some sections (around setting up Cloud DNS is commented) out.

# Instructions

You will need a GCP account will billing enabled.

You will need to set up the Cloud DNS Zone first (currently set up is commented out). If you don't do this, cert-manager won't be able to do the DNS TXT record challenge.

Modify variables.sh with the required information (get your static IP first). Then to get a cluster with Knative and Cert Manager installed just run `bash setup.sh` and use `bash teardown.sh` to, well tear it all down.
