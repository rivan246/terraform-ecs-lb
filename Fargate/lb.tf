resource "aws_alb" "helo" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["sg-021542c6a7b0fded5"]
  subnets            = ["subnet-09180b12451e6442e","subnet-0e56f73b313609111"]

  enable_deletion_protection = false


}

resource "aws_alb_target_group" "helo" {
  name     = "helo"
  port     = 80
  protocol = "HTTP"
  target_type = "ip"
  vpc_id   = "vpc-0c5a07f912292d5f0"
}

resource "aws_alb_listener" "helo" {
  load_balancer_arn = aws_alb.helo.arn
  port              = "80"
  protocol = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.helo.arn
  }
}