# fails
# CKV_GCP_6: "Ensure all Cloud SQL database instance requires all incoming connections to use SSL"
# CKV_GCP_14: "Ensure all Cloud SQL database instance have backup configuration enabled"
# CKV_GCP_50: "Ensure MySQL database 'local_infile' flag is set to 'off'"

# these should not trigger pass or fail as bd is mysql
# todo CKV_GCP_53: "Ensure PostgreSQL database 'log_disconnections' flag is set to 'on'"
# todo CKV_GCP_54: "Ensure PostgreSQL database 'log_lock_waits' flag is set to 'on'"
# todo CKV_GCP_55: "Ensure PostgreSQL database 'log_min_messages' flag is set to a valid value"

resource "google_sql_database_instance" "fail" {
  database_version = "MYSQL_8_0"
  name             = "mysql81"
  project          = "gcp-bridgecrew-deployment"
  region           = "us-central1"
  settings {
    ip_configuration {
      require_ssl  = false
      ipv4_enabled = false
      authorized_networks {
        value = "108.12.12.0/24"
        name  = "internal"
      }

      authorized_networks {
        value = "0.0.0.0/0"
        name  = "internet"
      }
    }
    activation_policy = "ALWAYS"
    tier              = "db-custom-1-3840"
    database_flags {
      name  = "night"
      value = "on"
    }
    database_flags {
      name  = "local_infile"
      value = "on"
    }


    availability_type = "ZONAL"
  }
}
