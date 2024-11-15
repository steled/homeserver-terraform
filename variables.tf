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

variable "ingress_ip_address" {
  type        = string
  description = "IP address for Ingress service"
}

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

variable "nextcloud_stg_domain" {
  type        = string
  description = "Domain for Nextcloud stg"
}

variable "nextcloud_stg_env" {
  type        = string
  description = "Environment for Nextcloud stg"
}

variable "nextcloud_stg_ip_address" {
  type        = string
  description = "IP address for Nextcloud stg service"
}

variable "nextcloud_stg_mail_fromaddress" {
  type = string
}

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
    host = string,
    user = string,
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
