module "nextcloud" {
  source="git@github.com:steled/terraformmodules.git//nextcloud?ref=modules"
  # source = "../terraformmodules/nextcloud/"

  ssh_user                      = var.server.user
  ssh_host                      = var.server.host

  nextcloud_version             = "3.5.13"
  kubernetes_namespace_name     = "nextcloud"
  nextcloud_domain              = "n3x7.5p4c3.duckdns.org"
  environment                   = "production"
  # ip_address                    = "172.24.45.2"
  ip_address                    = "172.28.155.2"
  nextcloud_admin_username      = "admin"
  nextcloud_admin_password      = "0R3Zus!fBbLPJhEwXRYhO"
  # nextcloud_proxies             = "172.16.4.30"
  nextcloud_proxies             = "172.28.155.30"
  mail_fromaddress              = "n3x7-info"
  mail_domain                   = "gmx.net"
  smtp_host                     = "mail.gmx.net"
  smtp_port                     = "587"
  smtp_username                 = "n3x7-info@gmx.net"
  smtp_password                 = "KCF2I6WGVDVOSW35F2WZ"
  postgresql_postgresqlusername = "nextcloud"
  postgresql_postgresqlpassword = "OCn5Zyg5VRJZwwuWrwKt"
  postgresql_postgresqldatabase = "nextcloud"
}
