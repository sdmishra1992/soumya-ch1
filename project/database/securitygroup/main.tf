terraform {
  backend "s3" {
    bucket = "mys3-tf-remotestate"
    key    = "databse_sg.tfstate"
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

module "rds_sg" {
  source = "../../../modules/compute/sg"

  aws_sg_name        = var.aws_sg_rds_name
  aws_sg_description = var.aws_sg_rds_description
  aws_sg_vpc         = data.terraform_remote_state.network.outputs.aws_vpc_id

  aws_sg_ingress_cidr = [
    {
      from_port   = 3306
      to_port     = 3306
      protocol    = 6
      description = "mysql port"
      cidr_blocks = "10.6.0.0/20"
    },
  ]

  aws_sg_egress = [
    {
      from_port   = 3306
      to_port     = 3306
      protocol    = 6
      description = "mysql port"
      cidr_blocks = "10.6.0.0/20"
    },
  ]
}