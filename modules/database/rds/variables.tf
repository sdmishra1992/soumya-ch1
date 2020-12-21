variable "aws_region" {
}
variable "identifier" {
  type        = string
}

variable "subnet_ids" {
  type        = list(string)
  default     = []
}

variable "engine_name" {
  type        = string
}

variable "major_engine_version" {
  type        = string
}

variable "allocated_storage" {
  type        = string
}
variable "storage_type" {
  type        = string
}
variable "engine" {
  type        = string
}
variable "engine_version" {
  type        = string
}
variable "instance_class" {
  type        = string
}
variable "name" {
  type        = string
}
variable "username" {
  type        = string
}
variable "password" {
  type        = string
}
variable "parameter_group_name" {
  type        = string
}
variable "multi_az" {
}