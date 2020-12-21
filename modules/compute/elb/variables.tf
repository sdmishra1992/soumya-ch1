variable "aws_elb_name" {
    description = "elb name"
    type        = string
    default     = ""
}
variable "aws_elb_subnets" {
    description = "elb subnets"
    type        = list
    default     = [""]
}
variable "aws_elb_internal" {
    description = "elb internal"
    type        = bool
}
variable "aws_elb_security_groups" {
    description = "elb sg"
    type        = list
    default     = [""]
}
variable "aws_elb_cross_zone_load_balancing" {
    description = "elb cross zone load balance"
    type        = string
    default     = ""
}
variable "aws_elb_idle_timeout" {
    description = "elb time out"
    type        = string
    default     = ""
}
variable "aws_elb_connection_draining" {
    description = "elb connection draining"
    type        = string
    default     = ""
}
variable "aws_elb_connection_draining_timeout" {
    description = "elb connection draining time out"
    type        = string
    default     = ""
}
variable "aws_elb_listener" {
    type        = map(any)
    default     = {}
}
variable "aws_elb_health_check" {
    type        = map(any)
    default     = {}
}