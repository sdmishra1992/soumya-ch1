variable "aws_region" {
  description = "aws_region"
  type        = string
  default     = ""
}
variable "engine_name" {
  description = "engine_name"
  type        = string
  default     = ""
}
variable "identifier" {
  description = "db identifier"
  type        = string
  default     = ""
}
variable "major_engine_version" {
  description = "major_engine_version"
  type        = string
  default     = ""
}
variable "allocated_storage" {
  description = "allocated_storage"
  default     = ""
}
variable "storage_type" {
  description = "storage_type"
  type        = string
  default     = ""
}
variable "engine" {
  description = "engine"
  type        = string
  default     = ""
}
variable "engine_version" {
  description = "engine_version"
  type        = string
  default     = ""
}
variable "instance_class" {
  description = "instance_class"
  type        = string
  default     = ""
}
variable "name" {
  description = "name"
  type        = string
  default     = ""
}
variable "username" {
  description = "db username"
  type        = string
  default     = ""
}
variable "password" {
  description = "db password"
  type        = string
  default     = ""
}
variable "parameter_group_name" {
  description = "parameter_group_name"
  type        = string
  default     = ""
}