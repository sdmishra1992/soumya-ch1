resource "aws_db_parameter_group" "this" {

  name_prefix = var.name_prefix
  description = "parameter group"
  family      = var.family

  tags = {
    Name = "parameter group"
  }

}