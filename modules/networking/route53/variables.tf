variable "aws_route53_domain_name" {
    description = "Hosted zone domain name"
    type        = string
    default     = ""
}
variable "aws_route53_description" {
    description = "Description of the DNS Zone"
    type        = string
    default     = ""
}
variable "aws_route53_vpc_id" {
    description = "Main VPC ID that will be associated with this hosted zone"
    type        = string
    default     = ""
}
variable "aws_route53_force_destroy" {
    description = "Whether to destroy all records inside if the hosted zone is deleted"
    type        = string
    default     = false
}
variable "aws_route53_vpc_region" {
    description = "Region of the VPC to associate"
    type        = string
    default     = ""
}
variable "aws_route53_record" {
  type = list
  description = "List of DNS Records to add to the DNS zone"
}