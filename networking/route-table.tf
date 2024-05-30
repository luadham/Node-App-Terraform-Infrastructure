resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "node-app-public-route-table"
  }
}


resource "aws_route_table_association" "public_subnet_route_table" {
  count = 2
  subnet_id      = [aws_subnet.public_subnet_a.id, aws_subnet.public_subnet_b.id][count.index]
  route_table_id = aws_route_table.public.id
}
