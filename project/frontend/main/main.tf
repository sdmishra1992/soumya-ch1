terraform {
  backend "s3" {
    bucket = "mys3-tf-remotestate"
    key    = "frontend.tfstate"
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
    key    = "frontend_sg.tfstate"
    region = var.aws_region
  }
}

data "aws_subnet" "pub_sub" {
  count = var.pub_subnet_count

  filter {
    name   = "tag:Name"
    values = ["public_subnet${count.index + 1}"]
  }
}

module "elb" {
  source = "../../../modules/compute/elb"

  aws_elb_name            = var.aws_elb_name
  aws_elb_subnets         = data.aws_subnet.pub_sub.*.id
  aws_elb_internal        = false
  aws_elb_security_groups = data.terraform_remote_state.network.outputs.aws_security_group_elb_id

  aws_elb_cross_zone_load_balancing   = true
  aws_elb_idle_timeout                = 60
  aws_elb_connection_draining         = true
  aws_elb_connection_draining_timeout = 600

  aws_elb_listener = {
    instance_port     = "80"
    instance_protocol = "HTTP"
    lb_port           = "80"
    lb_protocol       = "HTTP"
  }

  aws_elb_health_check = {
    target              = "HTTP:80/index.html"
    interval            = "30"
    healthy_threshold   = "2"
    unhealthy_threshold = "2"
    timeout             = "3"
  }
}

#----------userdata-------------#
data "template_file" "user_data" {
  template = "${file("user_data.tpl")}"
}

module "asg" {
  source = "../../../modules/compute/asg"

  aws_lc_name                     = var.aws_lc_name
  aws_image_id                    = var.aws_image_id
  aws_instance_type               = var.aws_instance_type
  aws_key_name                    = "my-app-key"
  aws_security_groups             = data.terraform_remote_state.network.outputs.aws_security_group_app_id
  aws_associate_public_ip_address = true
  aws_user_data                   = data.template_file.user_data.rendered

  aws_asg_name                      = var.aws_asg_name
  aws_asg_vpc_zone_identifier       = data.aws_subnet.pub_sub.*.id
  aws_asg_max_size                  = 2
  aws_asg_min_size                  = 2
  aws_asg_desired_capacity          = 2
  aws_asg_load_balancers            = module.elb.aws_elb_id
  aws_asg_health_check_grace_period = 1200
  aws_asg_health_check_type         = "ELB"
  aws_asg_termination_policies      = ["OldestLaunchConfiguration"]
}