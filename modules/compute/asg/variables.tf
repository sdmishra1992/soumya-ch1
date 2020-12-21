variable "aws_lc_name" {
    description = "lunch config name"
    type        = string
    default     = ""
}
variable "aws_image_id" {
    description = "lunch config image id"
    type        = string
    default     = ""
}
variable "aws_instance_type" {
    description = "lunch config instance type"
    type        = string
    default     = ""
}
variable "aws_iam_instance_profile" {
    description = "lunch config instance profile"
    type        = string
    default     = ""
}
variable "aws_key_name" {
    description = "lunch config key name for instance"
    type        = string
    default     = ""
}
variable "aws_security_groups" {
    description = "lunch config security groups"
    type        = list
    default     = [""]
}
variable "aws_associate_public_ip_address" {
    description = "lunch config public ip"
    type        = string
    default     = ""
}
variable "aws_user_data" {
    description = "lunch config userdata"
    type        = string
    default     = ""
}

variable "aws_asg_name" {
    description = "aws asg name"
    type        = string
    default     = ""
}
variable "aws_asg_vpc_zone_identifier" {
    description = "asg availability zone"
    type        = list
    default     = [""]
}
variable "aws_asg_max_size" {
    description = "asg max size"
    type        = string
    default     = ""
}
variable "aws_asg_min_size" {
    description = "asg min size"
    type        = string
    default     = ""
}
variable "aws_asg_desired_capacity" {
    description = "asg desire size"
    type        = any
}
variable "aws_asg_load_balancers" {
    description = "asg desire size"
    type        = list
    default     = [""]
}
variable "aws_asg_health_check_grace_period" {
    description = "asg health checks grace period"
    type        = string
    default     = ""
}
variable "aws_asg_health_check_type" {
    description = "asg health checks type"
    type        = string
    default     = ""
}
variable "aws_asg_min_elb_capacity" {
    description = "asg elb min capacity"
    type        = string
    default     = ""
}
variable "aws_asg_termination_policies" {
    description = "asg termination policies"
    type        = list
    default     = [""]
}

