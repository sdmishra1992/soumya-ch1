#_________________GLOBAL VARIABLES_________________#

aws_region              = "ap-south-1"

#_________________VPC VARIABLES_________________#

aws_vpc_name             = "myvpc"
vpc_cidr_base            = "10.6.0.0/20"
public_cidr_block1       = "10.6.1.0/24"
public_cidr_block2       = "10.6.2.0/24"
private_cidr_block1      = "10.6.3.0/24"
private_cidr_block2      = "10.6.4.0/24"

aws_igw_name             = "myvpc_igw"
aws_pub_routetable_name  = "public_routetable"
aws_pvt_routetable_name  = "private_routetable"

aws_pubsubnet_name1      = "public_subnet1"
aws_pubsubnet_name2      = "public_subnet2"
aws_pvtsubnet_name1      = "private_subnet1"
aws_pvtsubnet_name2      = "private_subnet2"

#_________________RDS VARIABLES_________________#

identifier               = "demodb"
engine_name              = "sqlserver-ex"
major_engine_version     = "14.00"
allocated_storage        = 20
storage_type             = "gp2"
engine                   = "mysql"
engine_version           = "5.7"
instance_class           = "db.t2.micro"
name                     = "mydb"
username                 = "soumya"
password                 = "soumya"
parameter_group_name     = "default.mysql5.7"

#_________________RDS SECURITY GROUP VARIABLES________________#

aws_sg_rds_name         = "my-rds-sg"
aws_sg_rds_description  = "mysql rds sg"

#_________________RDS DNS VARIABLES_________________#

aws_route53_domain_name = "db-dns.com"
aws_route53_description = "db route53 hosted zone"
aws_rds_route53_url     = "myrds"
aws_rds_route53_type    = "CNAME"

#_________________FRONTEND SECURITY GROUP VARIABLES_________________#

aws_sg_elb_name         = "my-elb-sg"
aws_sg_elb_description  = "elb sg"
aws_sg_app_name         = "my-app-sg"
aws_sg_app_description  = "app sg"

#_________________FRONTEND APP/ELB VARIABLES_________________#

aws_elb_name           = "my-elb"
pub_subnet_count       = "2"
aws_lc_name            = "my-lc"
aws_image_id           = "ami-08f63db601b82ff5f"
aws_instance_type      = "t2.micro"
aws_asg_name           = "my-asg"

#_________________FRONTEND DNS VARIABLES_________________#

aws_app_route53_domain_name = "app-dns.com"
aws_app_route53_description = "app route53 hosted zone"
aws_app_route53_url         = "myapp"
aws_app_route53_type        = "CNAME"