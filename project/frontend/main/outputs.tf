output "aws_elb_id" {
  description = "The name of the ELB"
  value       = "${module.elb.aws_elb_id}"
}

output "aws_elb_dns" {
  description = "The name of the ELB dns"
  value       = "${module.elb.aws_elb_dns}"
}