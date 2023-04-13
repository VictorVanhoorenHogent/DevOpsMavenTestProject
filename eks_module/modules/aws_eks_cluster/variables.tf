variable "aws_eks_cluster_name" {
    type = string
    default = "example"
  
}

variable "aws_eks_iam_role_name" {
    type = string
    default = "test_role"
  
}

variable "vpc_id" {
  type = string
  
}