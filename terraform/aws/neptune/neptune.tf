#fail

# CKV_AWS_101: "Ensure Neptune logging is enabled"
# CKV_AWS_44: "Ensure Neptune storage is securely encrypted"
# todo enable_cloudwatch_logs_exports =true
# todo ensure iam_database_authentication_enabled = true
# Ensure that IAM Database Authentication feature is enabled for your Amazon Neptune database clusters in order to make use of
# AWS Identity and Access Management (IAM) service to manage database access. With this feature enabled,
# you don't have to use a password when you connect to your Neptune clusters, instead all requests to your
# database clusters are automatically signed with an access key, which consists of an access key ID and secret access key.
# This rule can help you with the following compliance standards:
# APRA
# MAS
# NIST 800-53 (Rev. 4)
# todo Neptune cluster Auto Minor Version Upgrade
# Ensure that your Amazon Neptune database instances have the Auto Minor Version Upgrade feature enabled in order to receive automatically minor engine upgrades. The automatic upgrades are applied to Neptune instances during system maintenance window, defined by the day of the week, the time of day, and the time zone (UTC by default). Each minor version upgrade is fully available only after it is approved by Amazon Web Services.

# This rule can help you with the following compliance standards:

# APRA
# MAS
# NIST 800-53 (Rev. 4)

# Neptune Database Backup Retention Period
# Ensure AWS Neptune clusters have a sufficient backup retention period set for compliance purposes. backup_retention_period =gt 7

# todo Neptune Multi-AZ
# nsure that your Amazon Neptune graph database clusters are using Multi-AZ deployment configurations to enhance High Availability (HA) through automatic failover to read replicas in the event of a failure such as an Availability Zone (AZ) outage, an internal hardware or network outage, a software failure or in case of planned system maintenance.

# This rule can help you with the following compliance standards:

# NIST 800-53 (Rev. 4)

# tfsec
# Resource 'aws_neptune_cluster.default' uses default value for enable_cloudwatch_logs_exports
# Resource 'aws_neptune_cluster.default' does not have storage_encrypted set to true

resource "aws_neptune_cluster" "default" {
  cluster_identifier                  = var.neptune-dbname
  engine                              = "neptune"
  backup_retention_period             = 5
  preferred_backup_window             = "07:00-09:00"
  skip_final_snapshot                 = true
  iam_database_authentication_enabled = false
  apply_immediately                   = true
  storage_encrypted                   = false
  # enable_cloudwatch_logs_exports = false
  tags = { test = "Fail" }
}
