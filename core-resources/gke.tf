resource "google_container_cluster" "primary" {
  name                     = var.cluster_name
  location                 = "${var.region}-a"
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = google_compute_network.main.self_link
  subnetwork               = google_compute_subnetwork.private.self_link
  logging_service          = "logging.googleapis.com/kubernetes"
  monitoring_service       = "monitoring.googleapis.com/kubernetes"
  networking_mode          = "VPC_NATIVE"

  node_locations = [
    "${var.region}-b"
  ]

  addons_config {
    http_load_balancing {
      disabled = true
    }

    horizontal_pod_autoscaling {
      disabled = false
    }
  }

  release_channel {
    channel = "REGULAR"
  }

  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = "k8s-pods-range"
    services_secondary_range_name = "k8s-service-range"
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }

}

resource "google_service_account" "kubernetes" {
  account_id = "kubernetes"
}

resource "google_project_iam_member" "roles" {
  for_each = toset(var.roles)
  project  = var.project_id
  role     = each.key
  member   = "serviceAccount:${google_service_account.kubernetes.email}"
}

resource "google_container_node_pool" "first" {
  name       = "first"
  cluster    = google_container_cluster.primary.id
  node_count = 1

  management {
    auto_repair  = true
    auto_upgrade = true
  } 

  node_config {
    preemptible  = false
    machine_type = "e2-small"

    labels = {
      role = "first"
    }

    service_account = google_service_account.kubernetes.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}