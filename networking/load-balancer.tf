# Load Balancer
resource "aws_lb" "node_app_lb" {
  name                       = "node-app-lb"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.node_app_lb_security_group.id]
  subnets                    = [aws_subnet.public_subnet_a.id, aws_subnet.public_subnet_b.id]
  
  # access_logs {
  #   bucket  = aws_s3_bucket.lb_access_logs.id
  #   prefix  = "node-app-lb"
  #   enabled = true
  # }

  tags = {
    Environment = "production"
  }
}

# Load Balancer Listener
resource "aws_lb_listener" "app_listener" {
  load_balancer_arn = aws_lb.node_app_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app.arn
  }
}

# EC2 Target Group
resource "aws_lb_target_group" "app" {
  name     = "node-app-tg"
  port     = var.application_port
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    path                = var.health_end_point
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200-299"
  }

  tags = {
    Name = "app-target-group"
  }
}