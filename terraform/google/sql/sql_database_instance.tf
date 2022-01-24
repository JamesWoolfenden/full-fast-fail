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
