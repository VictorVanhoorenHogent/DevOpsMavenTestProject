variable "aws_vpc_id" {
    type = string
}

variable "aws_route_table_public_cidr" {
    type = string
    default = "0.0.0.0/0"
}

variable "aws_internet_gateway_id" {
    type = string
}

variable "aws_route_table_public_name" {
    type = map(any)
    default = {Name = "mypublicroute"}
}