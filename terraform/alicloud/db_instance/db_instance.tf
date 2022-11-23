# fails
# CKV_ALI_22: "Ensure Transparent Data Encryption is Enabled on instance"
# CKV_ALI_25: "Ensure RDS Instance SQL Collector Retention Period should be greater than 180"
# CKV_ALI_20: "Ensure RDS instance uses SSL"
# CKV_ALI_30: "Ensure RDS instance auto upgrades for minor versions"
# CKV_ALI_9: "Ensure database instance is not public"
# CKV_ALI_34: Ensure RDS instance is set to auto upgrade minor versions
# CKV_ALI_37: log connection
# CKV_ALI_36: logdosconnections
# CKV_ALI_35: enable logging
resource "alicloud_db_instance" "fail" {
  auto_upgrade_minor_version = "Manual"
  engine                     = "MySQL"
  engine_version             = "5.6"
  instance_type              = "rds.mysql.s2.large"
  instance_storage           = "30"
  instance_charge_type       = "Postpaid"
  instance_name              = "myfirstdb"
  vswitch_id                 = alicloud_vswitch.ditch.id
  monitoring_period          = "60"
  ssl_action                 = "Close"
  security_ips               = ["0.0.0.0/0"]
}

resource "alicloud_vswitch" "ditch" {
  vpc_id     = "anyoldtripe"
  cidr_block = "0.0.0.0/0"
}
