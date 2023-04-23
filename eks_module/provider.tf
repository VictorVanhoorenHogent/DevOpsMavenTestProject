provider "aws" {
    region     = var.region
    profile    = "myaws"
}

provider "helm" {
    kubernetes {
        host                   = data.aws_eks_cluster.ex.endpoint
        cluster_ca_certificate = base64decode(data.aws_eks_cluster.ex.certificate_authority[0].data)
            exec {
                api_version = "client.authentication.k8s.io/v1beta1"
                args        = ["eks", "get-token", "--cluster-name", data.aws_eks_cluster.ex.id]
                command     = "aws"
            }
    }
}