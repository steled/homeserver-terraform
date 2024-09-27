module "hassio" {
  source = "git@github.com:steled/terraformmodules.git//hassio?ref=modules"

  namespace = "hassio"
  host      = "h4s5.5p4c3.duckdns.org"
  # ip        = "172.16.3.20"
  ip        = "172.28.155.20"

  # depends_on = [ ssh_resource.install_k3s ]
}
