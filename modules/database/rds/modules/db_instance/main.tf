resource "aws_db_subnet_group" "this" {

  name_prefix = var.name_prefix
  description = "Database subnet group"
  subnet_ids  = var.subnet_ids

  tags = {
    Name = "private_subnet"
  }
}
resource "aws_db_instance" "default" {
  allocated_storage    = var.allocated_storage
  storage_type         = var.storage_type
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class 
  name                 = var.name 
  username             = var.username
  password             = var.password
  parameter_group_name = var.parameter_group_name
  db_subnet_group_name            = aws_db_subnet_group.this.id
  multi_az            = var.multi_az
}