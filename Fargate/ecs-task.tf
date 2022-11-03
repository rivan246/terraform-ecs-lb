resource "aws_ecs_task_definition" "hello" {
  family                   = "hello"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512
  
  container_definitions    = <<TASK_DEFINITION
[
  {
    "name": "hello",
    "image": "nginxdemos/hello",
    "cpu": 256,
    "memory": 512,
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 80
      }
    ],
    "essential": true
  }
]

TASK_DEFINITION

  runtime_platform {
    operating_system_family = "LINUX"
  }

}