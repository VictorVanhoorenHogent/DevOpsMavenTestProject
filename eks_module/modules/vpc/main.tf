resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = var.vpc_name
  enable_dns_hostnames = true
  enable_dns_support = true
}



