resource "aws_subnet" "private_subnet" {
  vpc_id     = var.vpc_id
  cidr_block = var.private_subnet_cidr
  tags       = var.private_subnet_tags
  availability_zone = var.private_subnet_availability_zone
}