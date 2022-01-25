# fails
# CKV_GCP_6: "Ensure all Cloud SQL database instance requires all incoming connections to use SSL"
# CKV2_GCP_7: "Ensure that a MySQL database instance does not allow anyone to connect with administrative privileges"
# CKV_GCP_11: "Ensure that Cloud SQL database Instances are not open to the world"
# CKV_GCP_14: "Ensure all Cloud SQL database instance have backup configuration enabled"
# CKV_GCP_50: "Ensure MySQL database 'local_infile' flag is set to 'off'"
# CKV_GCP_60: "Ensure Cloud SQL database does not have public IP"

# tfsec
# google-sql-no-public-access
# google-sql-enable-backup
# google-sql-encrypt-in-transit-data
# google-sql-mysql-no-local-infile

resource "google_sql_database_instance" "fail" {
  database_version = "MYSQL_8_0"
  name             = "mysql81"
  project          = "gcp-bridgecrew-deployment"
  region           = "us-central1"
  settings {
    ip_configuration {
      require_ssl  = false
      ipv4_enabled = true
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

resource "google_sql_user" "root_bad" {
  name     = "root@#"
  instance = google_sql_database_instance.fail.name
  host     = "me.com"
}