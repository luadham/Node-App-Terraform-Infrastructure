# Public Subnet A
resource "aws_subnet" "public_subnet_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet_a_cider
  availability_zone = var.zone_a
  tags = {
    Name = "Public Subnet A"
  }
}

# Public Subnet B
resource "aws_subnet" "public_subnet_b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet_b_cider
  availability_zone = var.zone_b
  tags = {
    Name = "Public Subnet B"
  }
}