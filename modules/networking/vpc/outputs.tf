output "aws_vpc_id" {
  value = aws_vpc.default.id
}

output "aws_vpc_cidr" {
  value = aws_vpc.default.cidr_block
}

output "aws_route_table_public_ids" {
  value = aws_route_table.public.id
}

output "aws_route_table_private_ids" {
  value = aws_route_table.public.id
}

output "aws_public_subnet1_ids" {
  value = aws_subnet.public1.id
}
output "aws_public_subnet2_ids" {
  value = aws_subnet.public2.id
}

output "aws_private_subnet1_ids" {
  value = aws_subnet.private1.id
}
output "aws_private_subnet2_ids" {
  value = aws_subnet.private2.id
}