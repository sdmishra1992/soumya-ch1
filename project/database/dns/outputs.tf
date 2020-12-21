output "aws_route53_zone_id" {
  value       = "${module.route53.aws_route53_zone_id}"
  description = "The private hosted zone id"
}