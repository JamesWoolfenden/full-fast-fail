# fails
# CKV_GCP_6: "Ensure all Cloud SQL database instance requires all incoming connections to use SSL"
# CKV_GCP_11: "Ensure that Cloud SQL database Instances are not open to the world"
# CKV_GCP_14: "Ensure all Cloud SQL database instance have backup configuration enabled"
# CKV_GCP_51: "Ensure PostgreSQL database 'log_checkpoints' flag is set to 'on'"
# CKV_GCP_52: "Ensure PostgreSQL database 'log_connections' flag is set to 'on'"
# CKV_GCP_53: "Ensure PostgreSQL database 'log_disconnections' flag is set to 'on'"
# CKV_GCP_54: "Ensure PostgreSQL database 'log_lock_waits' flag is set to 'on'"
# CKV_GCP_55: "Ensure PostgreSQL database 'log_min_messages' flag is set to a valid value"
# CKV_GCP_56: "Ensure PostgreSQL database 'log_temp_files flag is set to '0'"
# CKV_GCP_57: "Ensure PostgreSQL database 'log_min_duration_statement' flag is set to '-1'"
# CKV_GCP_60: "Ensure Cloud SQL database does not have public IP"
# should not trigger
# todo CKV2_GCP_7: "Ensure that a MySQL database instance does not allow anyone to connect with administrative privileges"


# tfsec
# google-sql-encrypt-in-transit-data
# google-sql-pg-no-min-statement-logging
# google-sql-pg-log-connections
# google-sql-pg-log-lock-waits
# google-sql-pg-log-disconnections
# google-sql-enable-backup
# google-sql-enable-pg-temp-file-logging
# google-sql-pg-log-checkpoints
# google-sql-no-public-access

resource "google_sql_database_instance" "fail_all" {
  database_version = "POSTGRES_12"
  name             = "general-pos121"
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
    backup_configuration {
      enabled = false
    }
    activation_policy = "ALWAYS"
    availability_type = "ZONAL"

    database_flags {
      name  = "log_checkpoints"
      value = "off"
    }
    database_flags {
      name  = "log_connections"
      value = "off"
    }
    database_flags {
      name  = "log_disconnections"
      value = "off"
    }
    database_flags {
      name  = "log_min_messages"
      value = "debug6"
    }
    database_flags {
      name  = "log_lock_waits"
      value = "off"
    }
    database_flags {
      name  = "log_temp_files"
      value = "10"
    }
    database_flags {
      name  = "log_min_duration_statement"
      value = "99"
    }
    pricing_plan = "PER_USE"

    tier = "db-custom-1-3840"
  }
}
