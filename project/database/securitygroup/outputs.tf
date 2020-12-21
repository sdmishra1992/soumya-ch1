output "aws_security_group_rds_id" {
  value       = "${module.rds_sg.aws_security_group_id}"
  description = "The rds mysql sg id"
}