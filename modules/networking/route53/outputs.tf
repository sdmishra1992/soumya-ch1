output "aws_route53_zone_id" {
  value       = "${aws_route53_zone.private.*.zone_id}"
  description = "The private hosted zone id"
}
output "aws_route53_records" {
  value       = "${aws_route53_record.records.*.name}"
  description = "The DNS record set names"
}