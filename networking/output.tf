output "vpc_id" {
  value = aws_vpc.main.id
}

output "web_server_sg" {
  value = aws_security_group.web_server_security_group
}

output "subnet_a" {
  value = aws_subnet.public_subnet_a
}

output "subnet_b" {
  value = aws_subnet.public_subnet_b
}

output "node_app_tg_arn" {
  value = aws_lb_target_group.app.arn
}