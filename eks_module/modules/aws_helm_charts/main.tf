resource "helm_release" "argocd" {
    name = "argocd"
    repository = "https://argoproj.github.io/argo-helm"
    chart = "argo-cd"
    namespace = "argocd" 
    create_namespace = true
    version = "3.35.4"

    values = [file("./modules/aws_helm_charts/values/argocd.yaml")]
  
}

resource "helm_release" "updater" {
    name = "updater"
    repository = "https://argoproj.github.io/argo-helm"
    chart = "argocd-image-updater"
    namespace = "argocd" 
    create_namespace = true
    version = "0.8.4"

    values = [file("./modules/aws_helm_charts/values/imageupdater.yaml")]
  
}

resource "helm_release" "sealed-secrets" {
    name = "sealed-secrets"
    repository = "https://charts.bitnami.com/bitnami"
    chart = "sealed-secrets"
    namespace = "kube-system" 
    create_namespace = true
    version = "1.2.11"

  
}