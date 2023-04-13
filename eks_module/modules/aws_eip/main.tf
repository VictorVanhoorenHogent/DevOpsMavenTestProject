resource "aws_eip" "nat1" {
    tags = var.aws_eip_name 
}

