
resource "google_sql_database_instance" "fail" {
  database_version = "POSTGRES_12"
  name             = "general-pos121"
  project          = "gcp-bridgecrew-deployment"
  region           = "us-central1"
  settings {
    activation_policy = "ALWAYS"
    availability_type = "ZONAL"
    database_flags = [{
      name  = "log_checkpoints"
      value = "on"
      }, {
      name  = "log_connections"
      value = "on"
      }, {
      name  = "log_disconnections"
      value = "off"
      }, {
      name  = "log_min_messages"
      value = "debug6"
      }, {
      name  = "log_lock_waits"
      value = "off"
      }, {
      name  = "log_temp_files"
      value = "30"
      }, {
      name  = "log_min_duration_statement"
      value = "1"
    }]
    pricing_plan     = "PER_USE"
    replication_type = "SYNCHRONOUS"
    tier             = "db-custom-1-3840"
  }
}
