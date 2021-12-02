# fail

# tfsec
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
