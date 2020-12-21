output "aws_rds_endpoint" {
  value       = "${module.db.db_instance_endpoint}"
  description = "The private hosted zone id"
}