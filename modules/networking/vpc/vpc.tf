#_________________VPC_________________#

resource "aws_vpc" "default" {
  cidr_block           = var.vpc_cidr_base
  instance_tenancy     = var.vpc_instance_tenancy
  enable_dns_support   = var.vpc_enable_dns_support
  enable_dns_hostnames = var.vpc_enable_dns_hostnames

  tags = {
    Name = var.aws_vpc_name
  }
}

#_________________INTERNET GATEWAY_________________#

resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.default.id

  tags = {
    Name = var.aws_igw_name
  }
}

resource "aws_network_acl" "public" {
  vpc_id = aws_vpc.default.id
  subnet_ids = [aws_subnet.public1.id,aws_subnet.public2.id]

  egress {
    protocol   = "-1"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "public_nacl"
  }
}

resource "aws_network_acl" "private" {
  vpc_id = aws_vpc.default.id
  subnet_ids = [aws_subnet.private1.id,aws_subnet.private2.id]

  egress {
    protocol   = "-1"
    rule_no    = 200
    action     = "allow"
    cidr_block = var.vpc_cidr_base
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = var.vpc_cidr_base
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "private_nacl"
  }
}