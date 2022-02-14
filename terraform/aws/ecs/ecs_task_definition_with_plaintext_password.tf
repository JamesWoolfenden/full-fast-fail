# fails todo secrets scan inside of a container definition - env vars
resource "aws_ecs_task_definition" "fail_password" {
  family = "service"
  container_definitions = jsonencode([
    {
      "command" : [],
      "cpu" : 0,
      "disableNetworking" : null,
      "dnsSearchDomains" : null,
      "dnsServers" : null,
      "dockerLabels" : null,
      "dockerSecurityOptions" : null,
      "entryPoint" : [],
      "environment" : [
        {
          "name" : "password",
          "value" : "123231231213"
        }
      ],
      "essential" : true,
      "extraHosts" : null,
      "hostname" : null,
      "image" : "cassandra:2",
      "links" : [],
      "logConfiguration" : null,
      "memory" : 512,
      "mountPoints" : [],
      "name" : "cassandra",
      "portMappings" : [
        {
          "containerPort" : 9042,
          "hostPort" : 9042,
          "protocol" : "tcp"
        }
      ],
      "privileged" : null,
      "readonlyRootFilesystem" : null,
      "ulimits" : null,
      "user" : null,
      "volumesFrom" : [],
      "workingDirectory" : null
    }
    ]
  )

  volume {
    name      = "service-storage"
    host_path = "/ecs/service-storage"
  }

  placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [us-west-2a, us-west-2b]"
  }
}
