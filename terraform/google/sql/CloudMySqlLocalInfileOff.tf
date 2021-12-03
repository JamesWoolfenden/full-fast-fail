
resource "google_sql_database_instance" "tfer--general-002D-mysql81" {
  database_version = "MYSQL_8_0"
  name             = "mysql81"
  project          = "gcp-bridgecrew-deployment"
  region           = "us-central1"
  settings {
    activation_policy = "ALWAYS"
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
