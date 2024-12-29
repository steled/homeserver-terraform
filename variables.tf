variable "cert_manager_email" {
  type        = string
  description = "Email for cert-mnanager"
}
variable "cilium_cidr" {
  type        = string
  description = "CIDR range for Cilium loadbalancer IP pool"
}

variable "cloudflare_api_token" {
  type        = string
  description = "Cloudflare API token for DNS settings"
}

variable "cloudflare_dns_zone_id" {
  type        = string
  description = "Cloudflare DNS zone ID"
}

variable "cloudflare_dnsrecord" {
  type        = list(string)
  description = "DNS records with IDs"
}

# variable "duckdns_webhook_ip_address" {
#   type        = string
#   description = "IP address for duckdns webhook service"
# }

variable "hashicorp_vault_domain" {
  type        = string
  description = "Domain for Hashicorp Vault"
}

variable "hashicorp_vault_env" {
  type        = string
  description = "Environment for Hashicorp Vault"
}

variable "hashicorp_vault_ip_address" {
  type        = string
  description = "IP address for Hashicorp Vault"
}

variable "hassio_domain" {
  type        = string
  description = "Domain for Hassio"
}

variable "hassio_ip_address" {
  type        = string
  description = "IP address for Hassio"
}

variable "hassio_env" {
  type        = string
  description = "Environment for Hassio"
}

# variable "ingress_ip_address" {
#   type        = string
#   description = "IP address for Ingress service"
# }

variable "jdownloader_env_jd_devicename" {
  type = string
}

variable "jdownloader_env_jd_email" {
  type = string
}

variable "jdownloader_env_jd_password" {
  type = string
}

variable "nextcloud_admin_password" {
  type        = string
  description = "Admin password for Nextcloud"
}

variable "nextcloud_admin_username" {
  type        = string
  description = "Admin username for Nextcloud"
}

variable "nextcloud_mail_domain" {
  type = string
}

variable "nextcloud_postgresql_username" {
  type = string
}

variable "nextcloud_postgresql_password" {
  type = string
}

variable "nextcloud_postgresql_database" {
  type = string
}

variable "nextcloud_redis_password" {
  type = string
}

variable "nextcloud_smtp_host" {
  type = string
}

variable "nextcloud_smtp_username" {
  type = string
}

variable "nextcloud_smtp_password" {
  type = string
}

variable "nextcloud_prd_ip_address" {
  type        = string
  description = "IP address for Nextcloud prd staging service"
}

variable "nextcloud_prd_domain" {
  type        = string
  description = "Domain for Nextcloud prd"
}

variable "nextcloud_prd_env" {
  type        = string
  description = "Environment for Nextcloud prd"
}

variable "nextcloud_prd_mail_fromaddress" {
  type = string
}

# variable "nextcloud_stg_domain" {
#   type        = string
#   default     = ""
#   description = "Domain for Nextcloud stg"
#   nullable    = true
# }

# variable "nextcloud_stg_env" {
#   type        = string
#   default     = ""
#   description = "Environment for Nextcloud stg"
#   nullable    = true
# }

# variable "nextcloud_stg_ip_address" {
#   type        = string
#   default     = ""
#   description = "IP address for Nextcloud stg service"
#   nullable    = true
# }

# variable "nextcloud_stg_mail_fromaddress" {
#   type     = string
#   default  = ""
#   nullable = true
# }

variable "nextcloud_proxies" {
  type        = string
  description = "Proxy addresses for Nextcloud"
}

variable "rsync_dst_folder_path" {
  type        = string
  description = "Destination folder path for rsync cronjob"
}

variable "rsync_dst_ip_address" {
  type        = string
  description = "Destination ip address for rsync cronjob"
}

variable "rsync_username" {
  type        = string
  description = "Username for rsync cronjob"
}

variable "rsync_src_folder_path" {
  type        = string
  description = "Source folder path for rsync cronjob"
}

variable "server" {
  description = "machine which will run the control plane"
  type = object({
    host        = string,
    user        = string,
    private_key = string,
  })
}

variable "sftp_ip_address" {
  type        = string
  description = "IP address for SFTP service"
}

# variable "k3s" {
#   type = object({
#     download_url = optional(string),
#     version = optional(string),
#   })
#   default = {}
# }

variable "longhorn_domain_prd" {
  type        = string
  description = "Domain for Longhorn prd"
}

variable "longhorn_env_prd" {
  type        = string
  description = "Environment for Longhorn prd"
}

variable "minio_ingress_domains_prd" {
  type        = string
  description = "Domains for MinIO ingress prd"
}

variable "minio_console_ingress_domains_prd" {
  type        = string
  description = "Domains for MinIO console ingress prd"
}

variable "minio_env_prd" {
  type        = string
  description = "Environment for MinIO prd"
}

variable "minio_rootUser" {
  type        = string
  description = "root user for MinIO"
}

variable "minio_rootPassword" {
  type        = string
  description = "root password for MinIO"
}

variable "minio_user1_name" {
  type        = string
  description = "User name for MinIO user1"
}

variable "minio_user1_password" {
  type        = string
  description = "User password for MinIO user1"
}

variable "minio_user1_policy" {
  type        = string
  description = "User policy for MinIO user1"
}

variable "minio_user1_secretKey" {
  type        = string
  description = "Secret key for MinIO user1"
}

variable "minio_user1_accessKey" {
  type        = string
  description = "Access key for MinIO user1"
}

variable "victoriametrics_vmsingle_domains" {
  type        = string
  description = "Domains for VictoriaMetrics VMSingle ingress prd"
}
variable "victoriametrics_alertmanager_domains" {
  type        = string
  description = "Domains for VictoriaMetrics Alertmanager ingress prd"
}
variable "victoriametrics_vmalert_domains" {
  type        = string
  description = "Domains for VictoriaMetrics VMAlert ingress prd"
}
variable "victoriametrics_vmagent_domains" {
  type        = string
  description = "Domains for VictoriaMetrics VMAgent ingress prd"
}
variable "victoriametrics_grafana_domains" {
  type        = string
  description = "Domains for VictoriaMetrics Grafana ingress prd"
}

variable "victoriametrics_env_prd" {
  type        = string
  description = "Environment for VictoriaMetrics prd"
}

variable "victoriametrics_grafana_admin_user" {
  type        = string
  description = "admin user for VictoriaMetrics"
}

variable "victoriametrics_grafana_admin_password" {
  type        = string
  description = "admin password for VictoriaMetrics"
}

variable "authentik_env_prd" {
  type        = string
  description = "Environment for Authentik prd"
}

variable "authentik_domains" {
  type        = string
  description = "Domains for Authentik ingress prd"
}

variable "authentik_secret_key" {
  type        = string
  description = "Secret key for Authentik prd"
}

variable "authentik_postgresql_password" {
  type        = string
  description = "PostgreSQL password for Authentik prd"
}

variable "authentik_bootstrap_password" {
  type        = string
  description = "Bootstrap password for Authentik prd"
}

variable "authentik_bootstrap_token" {
  type        = string
  description = "Bootstrap token for Authentik prd"
}

variable "authentik_bootstrap_email" {
  type        = string
  description = "Bootstrap email for Authentik prd"
}

variable "authentik_grafana_client_id" {
  type = string
}

variable "authentik_grafana_client_secret" {
  type = string
}

variable "authentik_url" {
  type = string
}

variable "grafana_allowed_redirect_uris" {
  type = string
}

variable "apprise_api_htpasswd_secret" {
  type        = string
  description = ".htpasswd secret for Apprise API"
}

variable "apprise_env_prd" {
  type        = string
  description = "Environment for Apprise prd"
}

variable "apprise_domain" {
  type        = string
  description = "Domain for Apprise ingress prd"
}

variable "apprise_config_id" {
  type        = string
  description = "Config id for Apprise"
}

variable "telegram_bot_token" {
  type = string
  description = "Bot token for Telegram"
}

variable "telegram_chat_id" {
  type = string
  description = "Chat id for Telegram"
}
