resource "aws_route_table" "route_table_public" {

    vpc_id = var.aws_vpc_id

    route {
        cidr_block = var.aws_route_table_public_cidr

        gateway_id = var.aws_internet_gateway_id
    }

    tags = var.aws_route_table_public_name
  
}


