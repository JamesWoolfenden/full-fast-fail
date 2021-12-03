# fail
# CKV_AWS_48: "Ensure MQ Broker logging is enabled"
# CKV_AWS_69: "Ensure MQ Broker is not publicly exposed"

# tfsec
# Resource 'aws_mq_broker.example' uses default value for logs.audit
# Resource 'aws_mq_broker.example' uses default value for logs.general
# Resource 'aws_mq_broker.example' does not have publicly_accessible set to false

resource "aws_mq_broker" "example" {
  broker_name = "example"

  engine_type         = "ActiveMQ"
  engine_version      = "5.15.0"
  host_instance_type  = "mq.t2.micro"
  publicly_accessible = true

  user {
    username = "ExampleUser"
    password = "MindTheGap"
  }
}
