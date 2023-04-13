resource "aws_route_table_association" "route_association_private" {
    subnet_id = var.aws_subnet_private_id
    route_table_id = var.aws_route_table_private_id
}

