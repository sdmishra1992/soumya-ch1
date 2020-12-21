resource "aws_db_option_group" "this" {

  name_prefix              = var.name_prefix
  option_group_description = "optiongroup"
  engine_name              = var.engine_name
  major_engine_version     = var.major_engine_version

tags = {
    Name = "option group"
  }
}