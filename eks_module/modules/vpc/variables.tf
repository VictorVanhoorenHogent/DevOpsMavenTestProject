variable "vpc_cidr" {
  type = string
  default = "192.168.0.0/16"
  
}

variable "vpc_name" {
    type = map(any)
    default = {
        Name = "My_vpc"
    }
  
}

variable "vpc_enable_dns_hostnames" {
  type = bool
  default = true

  
}

variable "vpc_enable_dns_support" {
  type = bool
  default = true
}