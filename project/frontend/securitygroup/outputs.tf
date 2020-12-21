output "aws_security_group_elb_id" {
  value       = "${module.elb_sg.aws_security_group_id}"
  description = "The elb sg id"
}

output "aws_security_group_app_id" {
  value       = "${module.app_sg.aws_security_group_id}"
  description = "The app sg id"
}