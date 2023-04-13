resource "aws_subnet" "public_subnet" {
  vpc_id     = var.vpc_id
  cidr_block = var.public_subnet_cidr
  tags       = var.public_subnet_tags
  availability_zone = var.public_subnet_availability_zone
  map_public_ip_on_launch = var.public_subnet_publicip_onlaunch
}