module "db_instance" {
  source = "./modules/db_instance"
  identifier = var.identifier
  name_prefix = "${var.identifier}-"

  allocated_storage    = var.allocated_storage
  storage_type         = var.storage_type
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class 
  name                 = var.name 
  username             = var.username
  password             = var.password
  parameter_group_name = var.parameter_group_name
  multi_az            = var.multi_az

}

