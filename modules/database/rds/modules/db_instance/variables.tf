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
variable "name_prefix" {
  description = "Creates a unique name beginning with the specified prefix"
  type        = string
}

variable "identifier" {
  description = "The identifier of the resource"
  type        = string
}

variable "subnet_ids" {
  description = "A list of VPC subnet IDs"
  type        = list(string)
  default     = []
}
variable "multi_az" {
}