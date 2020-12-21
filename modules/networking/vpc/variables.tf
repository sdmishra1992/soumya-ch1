variable "aws_region" {
}
variable "aws_vpc_name" {
}
variable "vpc_cidr_base" {
}
variable "vpc_instance_tenancy" {
  default = "default"
}
variable "vpc_enable_dns_support" {
  default = "true"
}
variable "vpc_enable_dns_hostnames" {
  default = "true"
}
variable "aws_igw_name" {
  default = ""
}
variable "aws_pubsubnet_name1" {
  default = ""
}
variable "aws_pubsubnet_name2" {
  default = ""
}
variable "aws_pvtsubnet_name1" {
  default = ""
}
variable "aws_pvtsubnet_name2" {
  default = ""
}
variable "aws_pvt_routetable_name" {
  default = ""
}
variable "aws_pub_routetable_name" {
  default = ""
}
variable "public_cidr_block1" {
}
variable "public_cidr_block2" { 
}
variable "private_cidr_block1" {
}
variable "private_cidr_block2" {
}