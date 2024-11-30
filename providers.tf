terraform {
  required_version = ">=1.3.0"

  required_providers {
    # ssh = {
    #   source  = "loafoe/ssh"
    #   version = "2.6.0"
    # }

    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.9.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 2.34.0"
    }
    kubectl = {
      source  = "alekc/kubectl"
      version = ">= 2.0.4"
    }

    # time = {
    #   source  = "hashicorp/time"
    #   version = "0.12.0"
    # }

    # remote = {
    #   source  = "tenstad/remote"
    #   version = "0.1.2"
    # }
  }

  # backend "http" { }
}

# provider "ssh" {}
# provider "time" {}
# provider "remote" {}
