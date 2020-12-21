terraform {
  backend "s3" {
    bucket = "mys3-tf-remotestate"
    key    = "frontend_r53.tfstate"
    region = "ap-south-1"
  }
}

provider "aws" {
  region  = var.aws_region
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

#----------terraform_remote_state-------------#
data "terraform_remote_state" "elb_dns" {
  backend = "s3"

  config = {
    bucket = "mys3-tf-remotestate"
    key    = "frontend.tfstate"
    region = var.aws_region
  }
}

module "route53" {
  source = "../../../modules/networking/route53"

  #----------hostedzone-------------#
  aws_route53_description = var.aws_app_route53_description
  aws_route53_domain_name = var.aws_app_route53_domain_name
  aws_route53_vpc_id      = data.terraform_remote_state.network.outputs.aws_vpc_id

  #----------DNS record with ALIAS-------------#

  aws_route53_record = [
    {
      name    = var.aws_app_route53_url
      type    = var.aws_app_route53_type
      ttl     = 300
      records = data.terraform_remote_state.elb_dns.outputs.aws_elb_dns
    },
  ]

}

