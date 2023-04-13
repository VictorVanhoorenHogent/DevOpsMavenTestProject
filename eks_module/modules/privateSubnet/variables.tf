variable "vpc_id" {
    type = string
    default = "myvpcid"

}

variable "private_subnet_cidr" {
    type = string
    default = "192.168.0.0/18"
  
}

variable "private_subnet_tags" {
    type = map(any)
    default = {
        Name = "my_subnet"
        "kubernetes.io/cluster/eks" = "shared"
        "kubernetes.io/role/elb" = 1
        
    }
  
}

variable "private_subnet_availability_zone" {
    type = string
    default = "eu-north-1a"
  
}
