resource "aws_security_group" "this" {
  name        = var.aws_sg_name
  description = var.aws_sg_description
  vpc_id      = var.aws_sg_vpc

    tags= {
   Name = var.aws_sg_name
  }
}

resource "aws_security_group_rule" "ingress_with_cidr" {
  count = length(var.aws_sg_ingress_cidr)
  type              = "ingress"
  from_port         = lookup(var.aws_sg_ingress_cidr[count.index],"from_port")
  to_port           = lookup(var.aws_sg_ingress_cidr[count.index],"to_port")
  protocol          = lookup(var.aws_sg_ingress_cidr[count.index],"protocol")
  cidr_blocks       = ["${lookup(var.aws_sg_ingress_cidr[count.index],"cidr_blocks")}"]
  description       = lookup(var.aws_sg_ingress_cidr[count.index],"description")
  security_group_id = aws_security_group.this.id
}

resource "aws_security_group_rule" "egress" {
  count = length(var.aws_sg_egress)
  type              = "egress"
  from_port         = lookup(var.aws_sg_egress[count.index],"from_port")
  to_port           = lookup(var.aws_sg_egress[count.index],"to_port")
  protocol          = lookup(var.aws_sg_egress[count.index],"protocol")
  cidr_blocks       = ["${lookup(var.aws_sg_egress[count.index],"cidr_blocks")}"]
  description       = lookup(var.aws_sg_egress[count.index],"description")
  security_group_id = aws_security_group.this.id
}