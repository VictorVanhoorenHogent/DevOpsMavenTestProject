variable "aws_eks_cluster_name" {
    type = string
  
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
