resource "aws_elb" "this" {
  name        = var.aws_elb_name

  subnets         = var.aws_elb_subnets
  internal        = var.aws_elb_internal
  security_groups = var.aws_elb_security_groups

  cross_zone_load_balancing   = var.aws_elb_cross_zone_load_balancing
  idle_timeout                = var.aws_elb_idle_timeout
  connection_draining         = var.aws_elb_connection_draining
  connection_draining_timeout = var.aws_elb_connection_draining_timeout

  listener {
    instance_port           = lookup(var.aws_elb_listener, "instance_port")
    instance_protocol       = lookup(var.aws_elb_listener, "instance_protocol")
    lb_port                 = lookup(var.aws_elb_listener, "lb_port")
    lb_protocol             = lookup(var.aws_elb_listener, "lb_protocol")
  }
  
  health_check {
    healthy_threshold   = lookup(var.aws_elb_health_check, "healthy_threshold")
    unhealthy_threshold = lookup(var.aws_elb_health_check, "unhealthy_threshold")
    target              = lookup(var.aws_elb_health_check, "target")
    interval            = lookup(var.aws_elb_health_check, "interval")
    timeout             = lookup(var.aws_elb_health_check, "timeout")
  }

  tags = {
    Name = var.aws_elb_name
  }
}