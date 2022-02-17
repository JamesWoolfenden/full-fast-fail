# fail
# CKV_AWS_97: "Ensure Encryption in transit is enabled for EFS volumes in ECS Task definitions"

# tfsec
# Resource 'aws_ecs_task_definition.fail' has efs configuration with in transit encryption implicitly disabled

resource "aws_ecs_task_definition" "fail" {
  family                = "service"
  container_definitions = <<EOF
[
  {
    "name": "my_service",
    "essential": true,
    "memory": 256,
    "environment": [
      { "name": "ENVIRONMENT", "value": "development" },
      { "name": "DATABASE_PASSWORD", "value": "oh no D:"}
    ]
  }
]
EOF

  volume {
    name = "service-storage"

    efs_volume_configuration {
      file_system_id = aws_efs_file_system.fs.id
      root_directory = "/opt/data"
      authorization_config {
        access_point_id = aws_efs_access_point.fail.id
        iam             = "ENABLED"
      }
    }
  }
  tags = { test = "Fail" }
}


resource "aws_efs_file_system" "fs" {
  tags = { test = "Fail" }
}

resource "aws_efs_access_point" "fail" {
  file_system_id = aws_efs_file_system.fs.id
  tags           = { test = "Fail" }
}

provider "aws" {
  region = "eu-west-2"
}
