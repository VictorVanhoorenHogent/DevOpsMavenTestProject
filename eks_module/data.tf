data "aws_eks_cluster" "ex" {
    depends_on = [
      module.aws_eks_node_group
    ]
    name = module.aws_eks_cluster.aws_eks_cluster_name
}

data "aws_eks_cluster_auth" "ex" {
    depends_on = [
      module.aws_eks_node_group
    ]
    name = module.aws_eks_cluster.aws_eks_cluster_name
}
