# fails
# CKV_GCP_6: "Ensure all Cloud SQL database instance requires all incoming connections to use SSL"
# CKV_GCP_57: "Ensure PostgreSQL database 'log_min_duration_statement' flag is set to '-1'"
# CKV_GCP_56: "Ensure PostgreSQL database 'log_temp_files flag is set to '0'"
# CKV_GCP_55: "Ensure PostgreSQL database 'log_min_messages' flag is set to a valid value"
# CKV_GCP_54: "Ensure PostgreSQL database 'log_lock_waits' flag is set to 'on'"
# CKV_GCP_53: "Ensure PostgreSQL database 'log_disconnections' flag is set to 'on'"
# CKV_GCP_52: "Ensure PostgreSQL database 'log_connections' flag is set to 'on'"
# CKV_GCP_51: "Ensure PostgreSQL database 'log_checkpoints' flag is set to 'on'"
# CKV_GCP_14: "Ensure all Cloud SQL database instance have backup configuration enabled"

# should not trigger
# todo CKV2_GCP_7: "Ensure that a MySQL database instance does not allow anyone to connect with administrative privileges"
# todo SQLServer? CKV_GCP_58: "Ensure SQL database 'cross db ownership chaining' flag is set to 'off'"
# todo SQLServer? CKV_GCP_59: "Ensure SQL database 'contained database authentication' flag is set to 'off'"
# todo SQLServer? CKV_GCP_60: "Ensure SQL database do not have public IP"
# CKV_GCP_50: "Ensure MySQL database 'local_infile' flag is set to 'off'"

resource "google_sql_database_instance" "fail" {
  database_version = "POSTGRES_12"
  name             = "general-pos121"
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
    backup_configuration {
      enabled = false
    }
    activation_policy = "ALWAYS"
    availability_type = "ZONAL"

    database_flags = [{
      name  = "log_checkpoints"
      value = "off"
      },
      {
        name  = "log_connections"
        value = "off"
      },
      {
        name  = "log_disconnections"
        value = "off"
      },
      {
        name  = "log_min_messages"
        value = "debug6"
      },
      {
        name  = "log_lock_waits"
        value = "off"
      },
      {
        name  = "log_temp_files"
        value = "10"
      },
      {
        name  = "log_min_duration_statement"
        value = "99"
    }]
    pricing_plan     = "PER_USE"
    replication_type = "SYNCHRONOUS"
    tier             = "db-custom-1-3840"
  }
}
