resource "ssh_resource" "install_k3s" {
  host        = var.server.host
  user        = var.server.user
  private_key = file(var.server.private_key)
  # agent    = true

  commands = [
    "curl -sfL ${local.k3s.download_url} | INSTALL_K3S_VERSION='${local.k3s.version}' sh -s - --write-kubeconfig-mode 644 --disable=servicelb --flannel-backend=none --disable-network-policy"
    # TODO: For HA k3s cluster setup
    # "curl -sfL ${local.k3s.download_url} | INSTALL_K3S_VERSION='${local.k3s.version}' sh -s - server --cluster-init --docker --write-kubeconfig-mode 644 --disable=traefik"
  ]

  timeout = "10m"

  depends_on = [ssh_resource.files]
}

resource "time_sleep" "wait_30_seconds_2" {
  destroy_duration = "30s"
}
# Note: Removed waiting for k3s server to be ready

resource "ssh_resource" "uninstall_k3s" {
  when        = "destroy"
  host        = var.server.host
  user        = var.server.user
  private_key = file(var.server.private_key)
  # agent       = true

  commands = ["bash -c 'ip link delete cilium_host; ip link delete cilium_net; ip link delete cilium_vxlan; iptables-save | grep -iv cilium | iptables-restore; ip6tables-save | grep -iv cilium | ip6tables-restore; /usr/local/bin/k3s-killall.sh; /usr/local/bin/k3s-uninstall.sh;'"]

  depends_on = [time_sleep.wait_30_seconds_2]
}
