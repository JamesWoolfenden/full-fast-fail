# fail
# CKV_ALI_20 use ssl_action
# CKV_ALI_9 is not public
# CKV_ALI_25 retention gt 180
# CKV_ALI_22 tds is enabled
# log disconnections
# log_connections
# log_duration
# todo Ensure auditing retention is greater than 6 months (sql_collector is on and sql_collector_config value is greater/equalto 6 momnths )
resource "alicloud_db_instance" "fail" {
  engine                     = "MySQL"
  engine_version             = "5.6"
  instance_type              = "rds.mysql.t1.small"
  instance_storage           = "10"
  tde_status                 = "Disabled"
  auto_upgrade_minor_version = "Manual"
  # ssl_action="Closed"
  security_ips = [
    "0.0.0.0",
    "10.23.12.24/24"
  ]
  parameters {
    name  = "innodb_large_prefix"
    value = "ON"
  }
  parameters {
    name  = "connect_timeout"
    value = "50"
  }
  parameters {
    name  = "log_disconnections"
    value = "OFF"
  }
  parameters {
    name  = "log_connections"
    value = "OFF"
  }
  parameters {
    name  = "log_duration"
    value = "OFF"
  }
}
