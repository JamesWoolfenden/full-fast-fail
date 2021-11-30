# fail
# CKV_AWS_74: "Ensure DocDB is encrypted at rest (default is unencrypted)"
# CKV_AWS_85: "Ensure DocDB Logging is enabled"
# CKV_AWS_90: "Ensure DocDB TLS is not disabled"
# CKV_AWS_104: "Ensure DocDB has audit logs enabled"

resource "aws_docdb_cluster" "examplea" {
  cluster_identifier = var.cluster_identifier
  engine             = "docdb"
  engine_version     = ""
  apply_immediately  = var.apply_immediately
  availability_zones = data.aws_availability_zones.available.names

  db_subnet_group_name            = aws_docdb_subnet_group.examplea.name
  db_cluster_parameter_group_name = aws_docdb_cluster_parameter_group.examplea.name
  deletion_protection             = var.deletion_protection
  master_username                 = var.master_username
  master_password                 = var.master_password
  backup_retention_period         = var.backup_retention_period
  preferred_backup_window         = "07:00-09:00"
  preferred_maintenance_window    = "sat:05:00-sat:07:00"
  skip_final_snapshot             = true
  vpc_security_group_ids          = []
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
  type    = string
  default = "enabled"
  validation {
    condition     = var.ttl_monitor == "enabled" || var.ttl_monitor == "disabled"
    error_message = "Can be enabled or disabled."
  }
}

variable "profiler" {
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
