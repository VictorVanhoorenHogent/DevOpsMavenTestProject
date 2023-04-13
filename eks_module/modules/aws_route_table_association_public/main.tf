resource "aws_route_table_association" "route_association_public" {
    subnet_id = var.aws_subnet_public_id
    route_table_id = var.aws_route_table_public_id
}

