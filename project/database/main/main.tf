terraform {
  backend "s3" {
    bucket = "mys3-tf-remotestate"
    key    = "rds.tfstate"
    region = "ap-south-1"
  }
}

provider "aws" {
  region = var.aws_region
}

data "aws_vpc" "default" {
  filter {
    name   = "tag:Name"
    values = ["myvpc"]
  }
}

data "aws_subnet_ids" "all" {
  vpc_id = data.aws_vpc.default.id
  filter {
    name   = "tag:Name"
    values = ["private*"]
  }
}

module "db" {
  source = "../../../modules/database/rds"
  aws_region = var.aws_region
  identifier = var.identifier

  engine_name              = var.engine_name
  major_engine_version     = var.major_engine_version

  subnet_ids = data.aws_subnet_ids.all.ids

  allocated_storage    = var.allocated_storage
  storage_type         = var.storage_type
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  name                 = var.name
  username             = var.username
  password             = var.password
  parameter_group_name = var.parameter_group_name
  multi_az = false

}