# fails
# todo check encryption options as comment

resource "aws_mq_broker" "positive1" {
  broker_name = "example"

  configuration {
    id       = aws_mq_configuration.test.id
    revision = aws_mq_configuration.test.latest_revision
  }

  engine_type        = "ActiveMQ"
  engine_version     = "5.15.9"
  host_instance_type = "mq.t2.micro"
  security_groups    = [aws_security_group.test.id]

  user {
    username = "ExampleUser"
    password = "MindTheGap"
  }

  # encryption_options {
  #   use_aws_owned_key=false
  #   kms_key_id=aws_kms_key.examplea.arn
  # }
}

resource "aws_kms_key" "example" {

}
