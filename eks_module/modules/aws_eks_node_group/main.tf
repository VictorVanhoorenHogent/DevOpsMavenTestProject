data "aws_subnets" "name" {
  filter {
    name = "tag:Name"
    values = ["private*"]
  }
}

resource "aws_eks_node_group" "example" {
  cluster_name    = var.aws_eks_cluster_name
  node_group_name = var.aws_eks_node_group
  node_role_arn   = aws_iam_role.node_group.arn
  subnet_ids      = data.aws_subnets.name.ids

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  ami_type = var.aws_eks_node_group_ami

  capacity_type = var.aws_eks_node_group_capacity_type

  disk_size = var.aws_eks_node_group_disk_size

  force_update_version = var.aws_eks_node_group_force_update

  instance_types = var.aws_eks_node_group_instance_type
  
  labels = var.aws_eks_node_group_role

  update_config {
    max_unavailable = 1
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.amazon_eks_worker_node_policy,
    aws_iam_role_policy_attachment.amazon_eks_CNI_policy,
    aws_iam_role_policy_attachment.amazon_ec2_container_registry_readonly,
  ]
}

resource "aws_iam_role" "node_group" {
  name = var.aws_node_group_iam_role_name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "amazon_eks_worker_node_policy" {
  role       = aws_iam_role.node_group.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_role_policy_attachment" "amazon_eks_CNI_policy" {
  role       = aws_iam_role.node_group.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

resource "aws_iam_role_policy_attachment" "amazon_ec2_container_registry_readonly" {
  role       = aws_iam_role.node_group.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}



