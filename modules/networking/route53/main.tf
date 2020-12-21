#----------Create TF module for AWS Route53-----------#

#----------Create Private hosted Zone-----------#

resource "aws_route53_zone" "private" {
  comment = var.aws_route53_description
  force_destroy = var.aws_route53_force_destroy
  name =  var.aws_route53_domain_name
  vpc {
    vpc_id = var.aws_route53_vpc_id
    vpc_region = var.aws_route53_vpc_region
  }
}
#----------Create multiple recordsets-----------#

resource "aws_route53_record" "records" {
  count = length(var.aws_route53_record)
  zone_id = aws_route53_zone.private.zone_id
  name = "${lookup(var.aws_route53_record[count.index],"name")}.${var.aws_route53_domain_name}"
  type = lookup(var.aws_route53_record[count.index],"type")
  ttl = lookup(var.aws_route53_record[count.index],"ttl")
  records = lookup(var.aws_route53_record[count.index],"records")
}

