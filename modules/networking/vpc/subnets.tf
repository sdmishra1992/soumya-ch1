## Public
resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.default.id
  cidr_block = var.public_cidr_block1
  availability_zone = "${var.aws_region}a"
  tags = {
    Name = var.aws_pubsubnet_name1
  }
}
resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.default.id
  cidr_block = var.public_cidr_block2
  availability_zone = "${var.aws_region}b"
  tags = {
    Name = var.aws_pubsubnet_name2
  }
}

#private
resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.default.id
  cidr_block = var.private_cidr_block1
  availability_zone = "${var.aws_region}a"
  tags = {
    Name = var.aws_pvtsubnet_name1
  }
}
resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.default.id
  cidr_block = var.private_cidr_block2
  availability_zone = "${var.aws_region}b"
  tags = {
    Name = var.aws_pvtsubnet_name2
  }
}