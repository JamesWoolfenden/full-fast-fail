# fails
# CKV_ALI_22: "Ensure Transparent Data Encryption is Enabled on instance"
# CKV_ALI_25: "Ensure RDS Instance SQL Collector Retention Period should be greater than 180"
# CKV_ALI_20: "Ensure RDS instance uses SSL"
# todo auto_upgrade_minor_version is enabled


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
}

resource "alicloud_vswitch" "ditch" {
  vpc_id     = "anyoldtripe"
  cidr_block = "0.0.0.0/0"
}
