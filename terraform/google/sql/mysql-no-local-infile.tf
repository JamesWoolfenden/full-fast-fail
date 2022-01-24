
# fails
# CKV_GCP_6: "Ensure all Cloud SQL database instance requires all incoming connections to use SSL"
# CKV_GCP_50: "Ensure MySQL database 'local_infile' flag is set to 'off'"
# CKV_GCP_14: "Ensure all Cloud SQL database instance have backup configuration enabled"

# tfsec
# mysql-no-local-infile
resource "google_sql_database_instance" "unknown" {
  name             = "db"
  database_version = "MYSQL_5_6"
  region           = "us-central1"
  settings {
    database_flags {
      name  = "local_infile"
      value = "on"
    }
    tier = "db-custom-1-3840"
  }
}
