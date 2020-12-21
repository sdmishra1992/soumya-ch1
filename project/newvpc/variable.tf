variable "aws_region" {
  description = "aws_region"
  type        = string
  default     = ""
}

variable "aws_vpc_name" {
  description = "aws_vpc_name"
  type        = string
  default     = ""
}

variable "vpc_cidr_base" {
  description = "vpc_cidr_base"
  type        = string
  default     = ""
}

variable "aws_igw_name" {
  description = "aws_igw_name"
  type        = string
  default     = ""
}

variable "public_cidr_block1" {
  description = "public_cidr_block1"
  type        = string
  default     = ""
}

variable "public_cidr_block2" {
  description = "public_cidr_block2"
  type        = string
  default     = ""
}

variable "private_cidr_block1" {
  description = "private_cidr_block1"
  type        = string
  default     = ""
}

variable "private_cidr_block2" {
  description = "private_cidr_block2"
  type        = string
  default     = ""
}

variable "aws_pubsubnet_name1" {
  description = "aws_pubsubnet_name1"
  type        = string
  default     = ""
}

variable "aws_pubsubnet_name2" {
  description = "aws_pubsubnet_name2"
  type        = string
  default     = ""
}

variable "aws_pvtsubnet_name1" {
  description = "aws_pvtsubnet_name1"
  type        = string
  default     = ""
}

variable "aws_pvtsubnet_name2" {
  description = "aws_pvtsubnet_name2"
  type        = string
  default     = ""
}

variable "aws_pub_routetable_name" {
  description = "aws_pub_routetable_name"
  type        = string
  default     = ""
}

variable "aws_pvt_routetable_name" {
  description = "aws_pvt_routetable_name"
  type        = string
  default     = ""
}