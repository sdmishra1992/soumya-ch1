terraform {
  backend "s3" {
    bucket = "mys3-tf-remotestate"
    key    = "network_vpc.tfstate"
    region = "ap-south-1"
  }
}

provider "aws" {
  region = var.aws_region
}

module "myvpc" {
  source = "../../modules/networking/vpc"

  aws_region          = var.aws_region
  aws_vpc_name        = var.aws_vpc_name
  vpc_cidr_base       = var.vpc_cidr_base
  public_cidr_block1  = var.public_cidr_block1
  public_cidr_block2  = var.public_cidr_block2
  private_cidr_block1 = var.private_cidr_block1
  private_cidr_block2 = var.private_cidr_block2

  aws_igw_name = var.aws_igw_name

  aws_pubsubnet_name1     = var.aws_pubsubnet_name1
  aws_pubsubnet_name2     = var.aws_pubsubnet_name2
  aws_pvtsubnet_name1     = var.aws_pvtsubnet_name1
  aws_pvtsubnet_name2     = var.aws_pvtsubnet_name2
  aws_pub_routetable_name = var.aws_pub_routetable_name
  aws_pvt_routetable_name = var.aws_pvt_routetable_name
}