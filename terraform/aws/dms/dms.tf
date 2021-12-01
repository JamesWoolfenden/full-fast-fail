# fail
# CKV_AWS_89: "DMS replication instance should not be publicly accessible"
# tfsec
# AWS011 Resource 'aws_dms_replication_instance.public' is exposed publicly

resource "aws_dms_replication_instance" "public" {
  engine_version             = "3.1.4"
  multi_az                   = false
  publicly_accessible        = true
  replication_instance_class = "dms.t2.micro"
  replication_instance_id    = "test-dms-replication-instance-tf"
}
