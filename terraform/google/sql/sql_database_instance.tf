resource "google_sql_database_instance" "instance1-fail" {
  name   = "instance"
  region = "us-central1"
  settings {
    tier = "db-f1-micro"
    ip_configuration {
      ipv4_enabled = true
      authorized_networks = [
        {
          name  = "XYZ"
          value = "1.2.3.4"
        },
        {
          name  = "Public"
          value = "0.0.0.0/0"
        },
        {
          name  = "ABC",
          value = "5.5.5.0/24"
        }
      ]
    }
  }
}
