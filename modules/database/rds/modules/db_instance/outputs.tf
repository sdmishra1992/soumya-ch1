output "this_db_instance_address" {
  description = "The address of the RDS instance"
  value       = aws_db_instance.default.address
}

output "db_instance_endpoint" {
  description = "The endpoint of the RDS instance"
  value       = aws_db_instance.default.endpoint
}

output "this_db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = aws_db_instance.default.arn
}


output "this_db_instance_id" {
  description = "The RDS instance ID"
  value       = aws_db_instance.default.id
}

output "this_db_instance_username" {
  description = "The master username for the database"
  value       = aws_db_instance.default.username
}