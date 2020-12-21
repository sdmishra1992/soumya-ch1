terraform {
  backend "s3" {
    bucket = "mys3-tf-remotestate"
    key    = "frontend_sg.tfstate"
    region = "ap-south-1"
  }
}

provider "aws" {
  region = var.aws_region
}

#----------terraform_remote_state-------------#
data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket = "mys3-tf-remotestate"
    key    = "network_vpc.tfstate"
    region = var.aws_region
  }
}

module "elb_sg" {
  source = "../../../modules/compute/sg"

  aws_sg_name        = var.aws_sg_elb_name
  aws_sg_description = var.aws_sg_elb_description
  aws_sg_vpc         = data.terraform_remote_state.network.outputs.aws_vpc_id

  aws_sg_ingress_cidr = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = 6
      description = "LB port"
      cidr_blocks = "0.0.0.0/0"
    },
  ]

  aws_sg_egress = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = 6
      description = "LB port"
      cidr_blocks = "10.6.0.0/20"
    },
  ]
}

module "app_sg" {
  source = "../../../modules/compute/sg"

  aws_sg_name        = var.aws_sg_app_name
  aws_sg_description = var.aws_sg_app_description
  aws_sg_vpc         = data.terraform_remote_state.network.outputs.aws_vpc_id

  aws_sg_ingress_cidr = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = 6
      description = "SSH app port"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = 6
      description = "From LB to app port"
      cidr_blocks = "10.6.0.0/20"
    },
  ]

  aws_sg_egress = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = 6
      description = "app egress"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}