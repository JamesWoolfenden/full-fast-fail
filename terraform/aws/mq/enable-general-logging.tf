# fail
# CKV_AWS_69: "Ensure MQ Broker is not publicly exposed"
# CKV_AWS_48: "Ensure MQ Broker logging is enabled"
# CKV_AWS_197: check for audit logs

# tfsec
# Resource 'aws_mq_broker.fail' does not have logs.general set to true
# Resource 'aws_mq_broker.fail' does not have logs.audit set to true

resource "aws_mq_broker" "fail" {
  broker_name = "example"

  configuration {
    id       = aws_mq_configuration.test.id
    revision = aws_mq_configuration.test.latest_revision
  }
  publicly_accessible = true
  engine_type         = "ActiveMQ"
  engine_version      = "5.15.0"
  host_instance_type  = "mq.t2.micro"
  security_groups     = [aws_security_group.test.id]

  user {
    username = "ExampleUser"
    password = "MindTheGap"
  }
  logs {
    general = false
    audit   = false
  }
}
