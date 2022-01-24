
resource "google_sql_database_instance" "fail-chain" {
  database_version = "SQLSERVER_2017_STANDARD"
  name             = "general-sqlserver12"
  project          = "gcp-bridgecrew-deployment"
  region           = "us-central1"

  settings {
    activation_policy = "ALWAYS"
    availability_type = "ZONAL"

    backup_configuration {
      binary_log_enabled             = "false"
      enabled                        = "true"
      location                       = "us"
      point_in_time_recovery_enabled = "false"
      start_time                     = "00:00"
    }

    database_flags {
      name  = "cross db ownership chaining"
      value = "on"
    }
    database_flags {
      name  = "contained database authentication"
      value = "off"
    }

    disk_autoresize = "true"
    disk_size       = "20"
    disk_type       = "PD_SSD"

    ip_configuration {
      ipv4_enabled    = "false"
      private_network = "projects/gcp-bridgecrew-deployment/global/networks/default"
      require_ssl     = "false"
    }

    location_preference {
      zone = "us-central1-a"
    }

    maintenance_window {
      day  = "1"
      hour = "0"
    }

    pricing_plan = "PER_USE"
    tier         = "db-custom-1-4096"
  }
}
