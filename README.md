# knative-gke

A condensed version to deploy a Knative Serving, Build and Eventing

Note to have logging working you can't use latest as per docs. This
uses 1.10.9-gke.5 see [this issue](https://github.com/knative/docs/issues/593) for more context.




## Instructions

Terraform apply gives an error when I run it as project owner.

```
google_container_cluster.primary: googleapi: Error 403: Required "container.clusters.create" permission(s) for "projects/jgrayston-serverless". See https://cloud.google.com/kubernetes-engine/docs/troubleshooting#gke_service_account_deleted for more info., forbidden
```

Please ignore or fix. :)

So..

1. `bash cluster.sh` wait for it to do it's thing.
2. `bash istio.sh` then `kubectl get pods -w --namespace istio-system`
and wait for all pods to be running or completed.
3. `bash knative.sh` which will install the latest serving, build and eventing along with ELK stack for logging and Grafana dashboards.
4. In knative/docs/eventing/samples/iot-core try and run it. I am using iot.sh to source the vars in or just copy and paste.

