variable "aws_vpc_id" {
    type = string
}

variable "aws_route_table_private_cidr" {
    type = string
    default = "0.0.0.0/0"
}

variable "aws_nat_gateway_id" {
    type = string
}

variable "aws_route_table_private_name" {
    type = map(any)
    default = {Name = "myprivateroute"}
}