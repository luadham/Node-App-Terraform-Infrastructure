# Create Main VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cider
}