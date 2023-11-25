data "remote_file" "kubeconfig" {
  for_each = local.servers
  conn {
    host        = each.value.host
    user        = each.value.user
    private_key = file(each.value.private_key)
  }

  path        = "/etc/rancher/k3s/k3s.yaml"
  depends_on  = [
    ssh_resource.install_k3s
  ]
}

resource "local_sensitive_file" "kubeconfig" {
  for_each        = data.remote_file.kubeconfig
  content         = replace(each.value.content, "127.0.0.1", each.value.conn[0].host)
  filename        = "~/.kube/${each.value.conn[0].host}_config"
  file_permission = 0600
}
