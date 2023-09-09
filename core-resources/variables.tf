variable "project_id" {
  description = "project id"
  default = "xxxx"
}

variable "region" {
  description = "region"
  default = "us-central1"
}

variable "roles" {
  type = list(string)
  default = [
    "roles/artifactregistry.reader",
    "roles/storage.objectViewer",
    "roles/servicemanagement.serviceController",
    "roles/logging.logWriter",
    "roles/monitoring.admin",
    "roles/cloudtrace.agent"
  ]
  description = "list of roles for the node pool service account."
}

variable "db_name" {
  description = "db name"
  default = ""
}

variable "cluster_name" {
  description = "cluster name"
  default = ""
}