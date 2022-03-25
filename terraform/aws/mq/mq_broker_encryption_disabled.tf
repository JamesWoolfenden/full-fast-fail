# fails
# CKV_AWS_197: "Ensure MQ Broker Audit logging is enabled"
# CKV_AWS_207: "Ensure MQ Broker minor version updates are enabled"
# CKV_AWS_208: "Ensure MQBroker version is current"
# CKV_AWS_209: Ensure MQ broker encrypted by KMS using a customer managed Key (CMK)
# CKV_AWS_48: "Ensure MQ Broker logging is enabled"
# CKV_SECRET_6: "Base64 High Entropy String"

resource "aws_mq_broker" "pass" {
  broker_name = "example"

  configuration {
    id       = aws_mq_configuration.fail.id
    revision = aws_mq_configuration.fail.latest_revision
  }

  engine_type        = "ActiveMQ"
  engine_version     = "5.15.13"
  host_instance_type = "mq.t2.micro"
  security_groups    = [aws_security_group.test.id]

  user {
    username = "ExampleUser"
    password = "MindTheGapps"
  }

  # encryption_options {
  #   use_aws_owned_key = false
  #   kms_key_id        = aws_kms_key.example.arn
  # }
  tags = { test = "Fail" }
}

resource "aws_kms_key" "example" {
  tags = { test = "Fail" }
}
