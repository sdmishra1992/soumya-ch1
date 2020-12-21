variable "aws_sg_name" {
    description = "aws sg name"
    type        = string
    default     = ""
}
variable "aws_sg_description" {
    description = "aws sg description"
    type        = string
    default     = ""
}
variable "aws_sg_vpc" {
    description = "sg vpc id"
    type        = string
    default     = ""
}
variable "aws_sg_ingress_cidr" {
    description = "ingress rules with cidr"
    type        = list
}
variable "aws_sg_egress" {
    description = "egress rules of sg"
    type        = list
}