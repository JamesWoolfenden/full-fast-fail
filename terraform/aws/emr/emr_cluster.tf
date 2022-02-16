# fail
# CKV_AWS_114
# CKV2_AWS_7: "Ensure that Amazon EMR clusters' security groups are not open to the world"
# CKV_AWS_25: "Ensure no security groups allow ingress from 0.0.0.0:0 to port 3389"
# CKV_AWS_23: "Ensure every security groups rule has a description"
# CKV_AWS_24: "Ensure no security groups allow ingress from 0.0.0.0:0 to port 22"
# CKV_AWS_114: "Ensure that EMR clusters with Kerberos have Kerberos Realm set"

resource "aws_emr_cluster" "test" {
  name          = "emr-test-arn"
  release_label = "emr-4.6.0"
  applications  = ["Spark"]

  termination_protection            = false
  keep_job_flow_alive_when_no_steps = true

  kerberos_attributes {
    kdc_admin_password = "somePassword"
  }
    tags = {
    "key" = "value"
  }
}

resource "aws_emr_cluster" "cluster_connected_to_wrong_group" {
  name          = "emr-test-arn"
  release_label = "emr-4.6.0"
  applications  = ["Spark"]

  ec2_attributes {
    emr_managed_master_security_group = aws_security_group.block_access_not_ok.id
    emr_managed_slave_security_group  = aws_security_group.block_access_not_ok.id
    instance_profile                  = "connected_to_aws_iam_instance_profile"
  }
    tags = {
    "key" = "value"
  }
}

resource "aws_security_group" "block_access_not_ok" {
  name        = "block_access"
  description = "Block all traffic"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
    tags = {
    "key" = "value"
  }
}
