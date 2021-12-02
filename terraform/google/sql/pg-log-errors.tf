

resource "google_sql_database_instance" "db" {
  name             = "db"
  database_version = "POSTGRES_12"
  region           = "us-central1"
  settings {
    database_flags {
      name  = "log_min_messages"
      value = "PANIC"
    }
  }
}
