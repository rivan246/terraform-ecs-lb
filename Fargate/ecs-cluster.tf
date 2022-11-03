resource "aws_ecs_cluster" "hello" {
  name = "hello"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_ecs_service" "hi" {
  name            = "hi"
  cluster         = aws_ecs_cluster.hello.id
  task_definition = aws_ecs_task_definition.hello.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  load_balancer {
    target_group_arn = aws_alb_target_group.helo.arn
    container_name   = aws_ecs_task_definition.hello.family
    container_port   = 80
  }
  

  network_configuration {
      assign_public_ip = true
      subnets = ["subnet-09180b12451e6442e"]
  }
   

}
