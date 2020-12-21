output "aws_launch_configuration_name" {
  value       = "${aws_launch_configuration.this.*.name}"
  description = "The lunch config name"
}

output "aws_autoscaling_group_id" {
  value       = "${aws_autoscaling_group.this.*.id}"
  description = "The autoscaling group"
}