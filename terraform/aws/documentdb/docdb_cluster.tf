# fail
# CKV_AWS_74: "Ensure DocDB is encrypted at rest (default is unencrypted)"
# CKV_AWS_85: "Ensure DocDB Logging is enabled"
# CKV_AWS_90: "Ensure DocDB TLS is not disabled"
# CKV_AWS_104: "Ensure DocDB has audit logs enabled"
# CKV_AWS_182: "Ensure Doc DB is encrypted by KMS using a customer managed Key (CMK)"
# todo Ensure that your Amazon DocumentDB database clusters have set a minimum backup retention period in order to fulfill your organization compliance requirements 7 or greate
# todo deletion protection is set to reasonable value not the default 1?
# todo  storage encrypted=true

# tfsec
# Resource 'aws_docdb_cluster.examplea' uses default value for storage_encrypted
# Resource 'aws_docdb_cluster.examplea' does not have enabled_cloudwatch_logs_exports set to one of [audit profiler]
# Resource 'aws_docdb_cluster.examplea' does not use CMK

resource "aws_docdb_cluster" "examplea" {
  cluster_identifier = var.cluster_identifier
  engine             = "docdb"
  engine_version     = ""
  apply_immediately  = var.apply_immediately
  availability_zones = data.aws_availability_zones.available.names

  db_subnet_group_name            = aws_docdb_subnet_group.examplea.name
  db_cluster_parameter_group_name = aws_docdb_cluster_parameter_group.examplea.name

  master_username              = var.master_username
  master_password              = var.master_password
  preferred_backup_window      = "07:00-09:00"
  preferred_maintenance_window = "sat:05:00-sat:07:00"
  skip_final_snapshot          = true
  vpc_security_group_ids       = []
  # enabled_cloudwatch_logs_exports = ["audit", "profiler"]
  # storage_encrypted = true #defaults to false

  # kms_key_id = aws_kms_key.example.arn
  # backup_retention_period=1 #default
  # deletion_protection             = true #disabled by default
  tags = {
    "key" = "value"
  }
}

resource "aws_docdb_cluster_parameter_group" "examplea" {
  family      = var.family
  name        = var.param_group_name
  description = "docdb cluster parameter group"

  parameter {
    name  = "tls"
    value = "disabled"
  }

  parameter {
    name  = "audit_logs"
    value = "disabled"
  }

  parameter {
    name  = "change_stream_log_retention_duration"
    value = var.change_stream_log_retention_duration
  }

  parameter {
    name  = "profiler"
    value = var.profiler
  }

  parameter {
    name  = "profiler_sampling_rate"
    value = var.profiler_sampling_rate
  }

  parameter {
    name  = "profiler_threshold_ms"
    value = var.profiler_threshold_ms
  }

  parameter {
    name  = "ttl_monitor"
    value = var.ttl_monitor
  }
  tags = {
    "key" = "value"
  }
}

variable "profiler_sampling_rate" {
  default     = 1.0
  type        = number
  description = "Defines the sampling rate for logged operations."
  validation {
    condition     = var.profiler_sampling_rate >= 0.0 || var.profiler_sampling_rate <= 1.0
    error_message = "Sampling rate >= 0.0 and equal or less than 1.0."
  }
}

variable "profiler_threshold_ms" {
  default     = 100
  type        = number
  description = "Defines the threshold for profiler"
  validation {
    condition     = var.profiler_threshold_ms >= 50 || var.profiler_threshold_ms <= 2147483646
    error_message = "Valid values lie 50-2147483646."
  }
}


variable "ttl_monitor" {
  description = "testcode"

  type    = string
  default = "enabled"
  validation {
    condition     = var.ttl_monitor == "enabled" || var.ttl_monitor == "disabled"
    error_message = "Can be enabled or disabled."
  }
}

variable "profiler" {
  description = "testcode"

  type    = string
  default = "disabled"
  validation {
    condition     = var.profiler == "enabled" || var.profiler == "disabled"
    error_message = "Can be enabled or disabled."
  }
}

variable "change_stream_log_retention_duration" {
  type        = number
  default     = 10800
  description = "Defines the duration of time (in seconds) that the change stream log is retained and can be consumed."
  validation {
    condition     = var.change_stream_log_retention_duration >= 3600 && var.change_stream_log_retention_duration <= 86400
    error_message = "Must be 3600-86400."
  }
}
