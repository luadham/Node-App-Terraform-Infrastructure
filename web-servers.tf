# Web Server A
resource "aws_instance" "webserver_a" {
  ami                         = var.amazon_ami
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  key_name                    = "Test"
  vpc_security_group_ids      = [module.networking.web_server_sg.id]
  subnet_id                   = module.networking.subnet_a.id
}

# Web Server B
resource "aws_instance" "webserver_b" {
  ami                         = var.amazon_ami
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  key_name                    = "Test"
  vpc_security_group_ids      = [module.networking.web_server_sg.id]
  subnet_id                   = module.networking.subnet_b.id
}

# Add EC2 To target group
resource "aws_lb_target_group_attachment" "node_app_tg_attachment" {
  count            = 2
  target_group_arn = module.networking.node_app_tg_arn
  target_id        = [aws_instance.webserver_a.id, aws_instance.webserver_b.id][count.index]
  port             = var.application_port
}