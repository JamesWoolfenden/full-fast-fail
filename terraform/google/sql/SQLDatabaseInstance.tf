# fails
# CKV_GCP_6: "Ensure all Cloud SQL database instance requires all incoming connections to use SSL"
# CKV_GCP_11: "Ensure that Cloud SQL database Instances are not open to the world"
# CKV_GCP_14: "Ensure all Cloud SQL database instance have backup configuration enabled"
# CKV_GCP_60: "Ensure Cloud SQL database does not have public IP"

# tfsec
# google-sql-encrypt-in-transit-data
# google-sql-enable-backup
# google-sql-no-public-access
resource "google_sql_database_instance" "instance1-fail" {
  name             = "instance"
  region           = "us-central1"
  database_version = "11"
  settings {
    tier = "db-f1-micro"
    ip_configuration {
      ipv4_enabled = true
      authorized_networks {
        name  = "XYZ"
        value = "1.2.3.4"
      }
      authorized_networks {
        name  = "Public"
        value = "0.0.0.0/0"
      }
      authorized_networks {
        name  = "ABC"
        value = "5.5.5.0/24"
      }

    }
  }
}
