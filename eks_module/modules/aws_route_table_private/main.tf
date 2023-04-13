resource "aws_route_table" "route_table_private" {

    vpc_id = var.aws_vpc_id

    route {
        cidr_block = var.aws_route_table_private_cidr

        gateway_id = var.aws_nat_gateway_id
    }

    tags = var.aws_route_table_private_name
  
}
