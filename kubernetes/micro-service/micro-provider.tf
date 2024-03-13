terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
  }
}

data "aws_eks_cluster" "hr-dev-Altschool-Project" {
  name = "hr-dev-Altschool-Project"
}
data "aws_eks_cluster_auth" "hr-dev-Altschool-Project_auth" {
  name = "hr-dev-Altschool-Project_auth"
}
provider "kubernetes" {
  host                   = data.aws_eks_cluster.hr-dev-Altschool-Project.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.hr-dev-Altschool-Project.certificate_authority[0].data)
  version          = "2.16.1"
  config_path = "~/.kube/config"
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", "hr-dev-Altschool-Project"]
    command     = "aws"
  }
}

resource "kubernetes_namespace" "kube-namespace" {
  metadata {
    name = "sock-shop"
  }
}
