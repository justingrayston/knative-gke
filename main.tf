provider "google" {

}

resource "google_container_node_pool" "np" {
    name = "default-node-pool"
    zone = "europe-west4-a"
    cluster = "${google_container_cluster.primary.name}"
    initial_node_count = 3

    node_config {
        machine_type = "n1-standard-4"
        oauth_scopes = [
            "service-control",
            "service-management",
            "compute-rw",
            "storage-ro",
            "cloud-platform",
            "logging-write",
            "monitoring-write",
            "pubsub",
            "datastore"
        ]
    }

    autoscaling {
        max_node_count = 10
        min_node_count = 2
    }

}

resource "google_container_cluster" "primary" {
    project = "jgrayston-serverless"
    name = "knative-prod"
    zone = "europe-west4-a"
    initial_node_count = "3"
}


# The following outputs allow authentication and connectivity to the GKE Cluster.
output "client_certificate" {
  value = "${google_container_cluster.primary.master_auth.0.client_certificate}"
}

output "client_key" {
  value = "${google_container_cluster.primary.master_auth.0.client_key}"
}

output "cluster_ca_certificate" {
  value = "${google_container_cluster.primary.master_auth.0.cluster_ca_certificate}"
}
