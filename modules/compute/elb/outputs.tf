output "aws_elb_id" {
  description = "The name of the ELB"
  value       = "${aws_elb.this.*.id}"
}

output "aws_elb_dns" {
  description = "The name of the ELB"
  value       = "${aws_elb.this.*.dns_name}"
}