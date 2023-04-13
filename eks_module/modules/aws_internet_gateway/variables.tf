variable "vpc_id" {
    type = string
    default = "myvpcid"

}

variable "aws_internet_gateway_name" {
    type = map(any)
    default = {
      "Name" = "mygateway" 
    }
}

