variable "aws_nat_gateway_name" {
  type = map(any)
  default = {
    Name = "mynatgateway"
  }
}

variable "aws_eip_id" {
  type = string
  default = "test"
}

variable "public_subnet_id" {
  type = string 
  default = "test"
}

