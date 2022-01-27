# fails
# CKV_GCP_6: "Ensure all Cloud SQL database instance requires all incoming connections to use SSL"
# CKV_GCP_11: "Ensure that Cloud SQL database Instances are not open to the world"
# CKV_GCP_14: "Ensure all Cloud SQL database instance have backup configuration enabled"
# CKV_GCP_58: "Ensure SQL database 'cross db ownership chaining' flag is set to 'off'"
# CKV_GCP_59: "Ensure SQL database 'contained database authentication' flag is set to 'off'"
# CKV_GCP_60: "Ensure Cloud SQL database does not have public IP"

# tfsec
# google-sql-encrypt-in-transit-data
# google-sql-no-cross-db-ownership-chaining
# google-sql-no-contained-db-auth
resource "google_sql_database_instance" "fail-auth" {
  database_version = "SQLSERVER_2017_STANDARD"
  name             = "general-sqlserver12"
  project          = "gcp-bridgecrew-deployment"
  region           = "us-central1"

  settings {
    activation_policy = "ALWAYS"
    availability_type = "ZONAL"

    backup_configuration {
      binary_log_enabled             = false
      enabled                        = false
      location                       = "us"
      point_in_time_recovery_enabled = false
      start_time                     = "00:00"
    }

    database_flags {
      name  = "cross db ownership chaining"
      value = "on"
    }
    database_flags {
      name  = "contained database authentication"
      value = "on"
    }


    disk_autoresize = "true"
    disk_size       = "20"
    disk_type       = "PD_SSD"

    ip_configuration {
      ipv4_enabled    = true
      private_network = "projects/gcp-bridgecrew-deployment/global/networks/default"
      require_ssl     = false
      authorized_networks {
        name  = "theworld"
        value = "0.0.0.0/0"
      }
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
