output "aws_vpc_id" {
  value = module.myvpc.aws_vpc_id
}

output "aws_vpc_cidr" {
  value = module.myvpc.aws_vpc_cidr
}

output "aws_route_table_public_ids" {
  value = module.myvpc.aws_route_table_public_ids
}

output "aws_route_table_private_ids" {
  value = module.myvpc.aws_route_table_private_ids
}

output "aws_public_subnet1_ids" {
  value = module.myvpc.aws_public_subnet1_ids
}
output "aws_public_subnet2_ids" {
  value = module.myvpc.aws_public_subnet2_ids
}

output "aws_private_subnet1_ids" {
  value = module.myvpc.aws_private_subnet1_ids
}
output "aws_private_subnet2_ids" {
  value = module.myvpc.aws_private_subnet2_ids
}