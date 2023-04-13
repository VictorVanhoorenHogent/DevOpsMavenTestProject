resource "aws_nat_gateway" "example" {
  allocation_id = var.aws_eip_id
  subnet_id     = var.public_subnet_id

  tags = var.aws_nat_gateway_name
}
