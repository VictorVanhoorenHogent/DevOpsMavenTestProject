resource "aws_internet_gateway" "name" {

    vpc_id = var.vpc_id
    tags = var.aws_internet_gateway_name

  
}

