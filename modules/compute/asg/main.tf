resource "aws_launch_configuration" "this" {

  name_prefix                 = var.aws_lc_name
  image_id                    = var.aws_image_id
  instance_type               = var.aws_instance_type
  iam_instance_profile        = var.aws_iam_instance_profile
  key_name                    = var.aws_key_name
  security_groups             = var.aws_security_groups
  associate_public_ip_address = var.aws_associate_public_ip_address
  user_data                   = var.aws_user_data
}

resource "aws_autoscaling_group" "this" {
  
  name = var.aws_asg_name
  launch_configuration = aws_launch_configuration.this.name
  vpc_zone_identifier  = var.aws_asg_vpc_zone_identifier
  max_size             = var.aws_asg_max_size
  min_size             = var.aws_asg_min_size
  desired_capacity     = var.aws_asg_desired_capacity

  load_balancers            = var.aws_asg_load_balancers
  health_check_grace_period = var.aws_asg_health_check_grace_period
  health_check_type         = var.aws_asg_health_check_type

  #min_elb_capacity          = var.aws_asg_min_elb_capacity
  termination_policies      = var.aws_asg_termination_policies

  tags = [
   {
    key                 = "Name"
    value               = var.aws_asg_name
    propagate_at_launch = true
  }
  ]

  lifecycle {
    create_before_destroy = true
  }
}
