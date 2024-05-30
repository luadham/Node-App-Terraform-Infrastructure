output "web_server_a" {
  value = aws_instance.webserver_a.public_ip
}


output "web_server_b" {
  value = aws_instance.webserver_b.public_ip
}