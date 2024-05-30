# Load Balancer Security Group
resource "aws_security_group" "node_app_lb_security_group" {
  name        = "node_app_lb_security_group"
  description = "Allow HTTP Traffic From and to Load Balancer"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name = "node_app_lb"
  }
}


# Web Server Security Group
resource "aws_security_group" "web_server_security_group" {
  name        = "web_server_sg"
  description = "Allow Traffic From and to Load Balancer"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = var.application_port
    to_port     = var.application_port
    protocol    = "tcp"
    cidr_blocks = [ aws_vpc.main.cidr_block ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [ aws_vpc.main.cidr_block ]
  }


  tags = {
    Name = "node_app_lb_webserver"
  }
}