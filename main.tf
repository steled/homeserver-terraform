provider "kubernetes" {
  config_path = "/home/steled/bm-cluster-kubeconfig"
  # config_path = "/home/steled/.kube/172.31.70.5_config"
  # config_path = "${local_sensitive_file.kubeconfig.filename}"
  # config_path = "/home/steled/.kube/172.18.162.170_config"
  # config_path = "${local_sensitive_file.kubeconfig[local.servers[0].host].filename}"
}

provider "helm" {
  kubernetes {
    config_path = "/home/steled/bm-cluster-kubeconfig"
    # config_path = "/home/steled/.kube/172.31.70.5_config"
    # config_path = "${local_sensitive_file.kubeconfig.filename}"
    # config_path = "${local_sensitive_file.kubeconfig[local.servers[0].host].filename}"
  }
}

provider "kubectl" {
  config_path = "/home/steled/bm-cluster-kubeconfig"
  # config_path = "${local_sensitive_file.kubeconfig.filename}"
  # config_path = "/home/steled/.kube/172.31.70.5_config"
}
