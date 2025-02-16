data "remote_file" "kubeconfig" {
  conn {
    host        = var.server.host
    user        = var.server.user
    private_key = file(var.server.private_key)
  }

  path = "/etc/rancher/k3s/k3s.yaml"

  depends_on  = [ ssh_resource.install_k3s ]
}

resource "local_sensitive_file" "kubeconfig" {
  content         = replace(data.remote_file.kubeconfig.content, "127.0.0.1", var.server.host)
  filename        = pathexpand("~/.kube/config")
  file_permission = 0600

  depends_on  = [ ssh_resource.install_k3s ]
}
