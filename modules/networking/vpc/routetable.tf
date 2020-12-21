# Routing table for public subnets
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.default.id
  tags = {
    Name = var.aws_pub_routetable_name
  }
}

# Routing table for private subnets
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.default.id
  tags = {
    Name = var.aws_pvt_routetable_name
  }
}

# Public Routing table internet access
resource "aws_route" "public_internet_gateway" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.default.id
}

# Public Routing table association with public subnets
resource "aws_route_table_association" "public1" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "public2" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public.id
}

# Private Routing table association with private subnets
resource "aws_route_table_association" "private1" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private.id
}
resource "aws_route_table_association" "private2" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private.id
}