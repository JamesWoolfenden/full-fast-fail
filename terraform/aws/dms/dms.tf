# fail
# CKV_AWS_89: "DMS replication instance should not be publicly accessible"
# CKV_AWS_212 Ensure Encryption with CMK
# todo auto_minor_version_upgrade=false

# tfsec
# AWS011 Resource 'aws_dms_replication_instance.public' is exposed publicly

resource "aws_dms_replication_instance" "fail" {
  engine_version             = "3.1.4"
  multi_az                   = false
  publicly_accessible        = true
  replication_instance_class = "dms.t2.micro"
  replication_instance_id    = "test-dms-replication-instance-tf"
  # kms_key_arn = ""
  # auto_minor_version_upgrade=false
}
