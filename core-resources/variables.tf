variable "project_id" {
  description = "project id"
  default = "sisutech71819"
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