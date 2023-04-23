variable "region" {
    type = string
    description = "region of the resources"
    default = "eu-north-1"
  
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


variable "vpc_id" {
    type = string
    default = "myvpcid"

}

variable "public_subnet_cidr" {
    type = string
    default = "192.168.0.0/18"
  
}

variable "public_subnet_tags" {
    type = map(any)
    default = {
        Name = "my_subnet"
        "kubernetes.io/cluster/eks" = "shared"
        "kubernetes.io/role/elb" = 1
        
    }
  
}

variable "public_subnet_availability_zone" {
    type = string
    default = "eu-north-1a"
  
}

variable "public_subnet_publicip_onlaunch" {
  type = bool
  default = true
  
}

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

variable "private_subnet_config" {
  type    = map(object({
    private_subnet_availability_zone = string
    private_subnet_cidr = string
    private_subnet_tags = map(any)
    aws_eip_name = map(any)
    aws_nat_gateway_name = map(any)
    aws_route_table_private_cidr = string
    aws_route_table_private_name = map(any)
  }))
}

variable "public_subnet_config" {
  type    = map(object({
    public_subnet_availability_zone = string
    public_subnet_cidr = string
    public_subnet_tags = map(any)
    public_subnet_publicip_onlaunch = bool
  }))
}

//=================== elastic ip ======================\\

variable "aws_eip_name" {
    type = map(any)
    default = {
      Name = "nat1" 
    }
  
}

//=================== nat gateway ======================\\

variable "aws_nat_gateway_name" {
  type = map(any)
  default = {
    Name = "mynatgateway"
  }
}

variable "aws_eip_id" {
  type = string 
  default =  "test"
}

variable "aws_internet_gateway_name" {
    type = map(any)
    default = {
      "Name" = "mygateway" 
    }
}

variable "aws_route_table_public_cidr" {
    type = string
    default = "0.0.0.0/0"
}

variable "aws_internet_gateway_id" {
    type = string
    default = "test"
}

variable "aws_route_table_public_name" {
    type = map(any)
    default = {
      Name = "mypublicroute"
    }
}

variable "aws_route_table_private_cidr" {
    type = string
    default = "0.0.0.0/0"
}

variable "aws_nat_gateway_id" {
    type = string
    default = "test"
}

variable "aws_route_table_private_name" {
    type = map(any)
    default = {Name = "myprivateroute"}
}


variable "aws_route_table_public_id" {
    type = string
    default = "mypublicroutetableid"
}

variable "aws_route_table_private_id" {
    type = string
    default = "myprivateroutetableid"
}

variable "public_subnet_id" {
    type = string
    default = "mypublicsubnetid"
}

variable "private_subnet_id" {
    type = string
    default = "myprivatesubnetid"
}

variable "aws_eks_cluster_name" {
    type = string
    default = "example"
  
}

variable "aws_eks_iam_role_name" {
    type = string
    default = "test_role"
  
}

variable "aws_eks_node_group" {
    type = string
    default = "example"
  
}


variable "aws_node_group_iam_role_name" {
    type = string
    default = "test_role2"
  
}

variable "aws_eks_node_group_ami" {
    type = string
    default = "AL2_x86_64"
  
}

variable "aws_eks_node_group_capacity_type" {
  type = string
  default = "ON_DEMAND"
}

variable "aws_eks_node_group_disk_size" {
    type = number
    default = 100
  
}

variable "aws_eks_node_group_force_update" {
    type = bool
    default = false
  
}

variable "aws_eks_node_group_instance_type" {
    type = list(string)
    default = ["t3.small"]

  
}

variable "aws_eks_node_group_role" {
    type = map(any)
    default = {
    role = "nodes-general"
  }
  
}

