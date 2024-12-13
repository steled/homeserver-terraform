module "nextcloud" {
  source="git@github.com:steled/terraformmodules.git//nextcloud?ref=main"
  # source = "../terraformmodules/nextcloud/"

  ssh_user                  = var.server.user
  ssh_host                  = var.server.host

  nextcloud_version         = "6.2.3" # get version from here: https://github.com/nextcloud/helm/blob/main/charts/nextcloud/Chart.yaml#L3
  kubernetes_namespace_name = "nextcloud"
  maintenance_job_image     = "nextcloud:30.0.2-fpm" # get version from here: https://github.com/nextcloud/helm/blob/main/charts/nextcloud/Chart.yaml#L4
  nextcloud_domain          = var.nextcloud_prd_domain
  environment               = var.nextcloud_prd_env
  ip_address                = var.nextcloud_prd_ip_address
  nextcloud_admin_username  = var.nextcloud_admin_username
  nextcloud_admin_password  = var.nextcloud_admin_password
  nextcloud_proxies         = var.nextcloud_proxies
  mail_fromaddress          = var.nextcloud_prd_mail_fromaddress
  mail_domain               = var.nextcloud_mail_domain
  smtp_host                 = var.nextcloud_smtp_host
  smtp_port                 = "587"
  smtp_username             = var.nextcloud_smtp_username
  smtp_password             = var.nextcloud_smtp_password
  redis_password            = var.nextcloud_redis_password
  postgresql_username       = var.nextcloud_postgresql_username
  postgresql_password       = var.nextcloud_postgresql_password
  postgresql_database       = var.nextcloud_postgresql_database

  depends_on = [ module.cert_manager_cloudflare ]
}
