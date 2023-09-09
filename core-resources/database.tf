resource "google_sql_database_instance" "instance" {
  name             = var.db_name
  region           = var.region
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-f1-micro"
      ip_configuration {
      ipv4_enabled    = false
      private_network = google_compute_network.main.id

    }
  }
  depends_on = [google_compute_network.main,
  google_service_networking_connection.vpc_peering
  ]

  //Set to true for prod envs to prevent the database from being deleted
  deletion_protection  = "false"
}

resource "google_sql_database" "database" {
  name     = var.db_name
  instance = google_sql_database_instance.instance.name
}

resource "google_sql_user" "admin_user" {
  name     = "test-user"
  instance = google_sql_database_instance.instance.name
  password = "password"
}