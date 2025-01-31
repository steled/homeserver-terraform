# homeserver-terraform
Repository for HomeServer install/config via Terraform

source: https://github.com/mrsauravsahu/kube-homelab/tree/main

# TF Docs

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.10 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | ~> 2.17 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | ~> 2.1 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.35 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubectl"></a> [kubectl](#provider\_kubectl) | ~> 2.1 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | ~> 2.35 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_apprise"></a> [apprise](#module\_apprise) | git@github.com:steled/terraformmodules.git//apprise | v0.12 |
| <a name="module_argocd"></a> [argocd](#module\_argocd) | git@github.com:steled/terraformmodules.git//argocd | v0.12 |
| <a name="module_cert_manager_cloudflare"></a> [cert\_manager\_cloudflare](#module\_cert\_manager\_cloudflare) | git@github.com:steled/terraformmodules.git//cert-manager_cloudflare | v0.12 |
| <a name="module_hassio"></a> [hassio](#module\_hassio) | git@github.com:steled/terraformmodules.git//hassio | v0.12 |
| <a name="module_jdownloader"></a> [jdownloader](#module\_jdownloader) | git@github.com:steled/terraformmodules.git//jdownloader | v0.12 |
| <a name="module_longhorn"></a> [longhorn](#module\_longhorn) | git@github.com:steled/terraformmodules.git//longhorn | v0.12 |
| <a name="module_minio"></a> [minio](#module\_minio) | git@github.com:steled/terraformmodules.git//minio | v0.12 |
| <a name="module_nextcloud"></a> [nextcloud](#module\_nextcloud) | git@github.com:steled/terraformmodules.git//nextcloud | v0.12 |
| <a name="module_victoriametrics"></a> [victoriametrics](#module\_victoriametrics) | git@github.com:steled/terraformmodules.git//victoriametrics | v0.12 |

## Resources

| Name | Type |
|------|------|
| [kubectl_manifest.ciliuml2announcementpolicy](https://registry.terraform.io/providers/alekc/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.ciliumloadbalancerippool](https://registry.terraform.io/providers/alekc/kubectl/latest/docs/resources/manifest) | resource |
| [kubernetes_config_map_v1.cloudflare_dyndns_script](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/config_map_v1) | resource |
| [kubernetes_cron_job_v1.cloudflare_dyndns_cronjob](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/cron_job_v1) | resource |
| [kubernetes_secret_v1.cloudflare_dyndns_secret](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret_v1) | resource |
| [terraform_data.files](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apprise_api_htpasswd_secret"></a> [apprise\_api\_htpasswd\_secret](#input\_apprise\_api\_htpasswd\_secret) | .htpasswd secret for Apprise API | `string` | n/a | yes |
| <a name="input_apprise_config_id"></a> [apprise\_config\_id](#input\_apprise\_config\_id) | Config id for Apprise | `string` | n/a | yes |
| <a name="input_apprise_domain"></a> [apprise\_domain](#input\_apprise\_domain) | Domain for Apprise ingress prd | `string` | n/a | yes |
| <a name="input_apprise_env_prd"></a> [apprise\_env\_prd](#input\_apprise\_env\_prd) | Environment for Apprise prd | `string` | n/a | yes |
| <a name="input_argocd_accounts_steled_password"></a> [argocd\_accounts\_steled\_password](#input\_argocd\_accounts\_steled\_password) | Password for Argo CD user steled | `string` | n/a | yes |
| <a name="input_argocd_apps_sshPrivateKey"></a> [argocd\_apps\_sshPrivateKey](#input\_argocd\_apps\_sshPrivateKey) | SSH private key for argocd-apps repository | `string` | n/a | yes |
| <a name="input_argocd_domain_prd"></a> [argocd\_domain\_prd](#input\_argocd\_domain\_prd) | Domain for Argo CD ingress prd | `string` | n/a | yes |
| <a name="input_argocd_env_prd"></a> [argocd\_env\_prd](#input\_argocd\_env\_prd) | Environment for Argo CD prd | `string` | n/a | yes |
| <a name="input_authentik_grafana_client_id"></a> [authentik\_grafana\_client\_id](#input\_authentik\_grafana\_client\_id) | n/a | `string` | n/a | yes |
| <a name="input_authentik_grafana_client_secret"></a> [authentik\_grafana\_client\_secret](#input\_authentik\_grafana\_client\_secret) | n/a | `string` | n/a | yes |
| <a name="input_authentik_url"></a> [authentik\_url](#input\_authentik\_url) | n/a | `string` | n/a | yes |
| <a name="input_cert_manager_email"></a> [cert\_manager\_email](#input\_cert\_manager\_email) | Email for cert-mnanager | `string` | n/a | yes |
| <a name="input_cilium_cidr"></a> [cilium\_cidr](#input\_cilium\_cidr) | CIDR range for Cilium loadbalancer IP pool | `string` | n/a | yes |
| <a name="input_cloudflare_api_token"></a> [cloudflare\_api\_token](#input\_cloudflare\_api\_token) | Cloudflare API token for DNS settings | `string` | n/a | yes |
| <a name="input_cloudflare_dns_zone_id"></a> [cloudflare\_dns\_zone\_id](#input\_cloudflare\_dns\_zone\_id) | Cloudflare DNS zone ID | `string` | n/a | yes |
| <a name="input_cloudflare_dnsrecord"></a> [cloudflare\_dnsrecord](#input\_cloudflare\_dnsrecord) | DNS records with IDs | `list(string)` | n/a | yes |
| <a name="input_hassio_domain"></a> [hassio\_domain](#input\_hassio\_domain) | Domain for Hassio | `string` | n/a | yes |
| <a name="input_hassio_env"></a> [hassio\_env](#input\_hassio\_env) | Environment for Hassio | `string` | n/a | yes |
| <a name="input_hassio_ip_address"></a> [hassio\_ip\_address](#input\_hassio\_ip\_address) | IP address for Hassio | `string` | n/a | yes |
| <a name="input_jdownloader_env_jd_devicename"></a> [jdownloader\_env\_jd\_devicename](#input\_jdownloader\_env\_jd\_devicename) | n/a | `string` | n/a | yes |
| <a name="input_jdownloader_env_jd_email"></a> [jdownloader\_env\_jd\_email](#input\_jdownloader\_env\_jd\_email) | n/a | `string` | n/a | yes |
| <a name="input_jdownloader_env_jd_password"></a> [jdownloader\_env\_jd\_password](#input\_jdownloader\_env\_jd\_password) | n/a | `string` | n/a | yes |
| <a name="input_longhorn_domain_prd"></a> [longhorn\_domain\_prd](#input\_longhorn\_domain\_prd) | Domain for Longhorn prd | `string` | n/a | yes |
| <a name="input_longhorn_env_prd"></a> [longhorn\_env\_prd](#input\_longhorn\_env\_prd) | Environment for Longhorn prd | `string` | n/a | yes |
| <a name="input_minio_console_ingress_domains_prd"></a> [minio\_console\_ingress\_domains\_prd](#input\_minio\_console\_ingress\_domains\_prd) | Domains for MinIO console ingress prd | `string` | n/a | yes |
| <a name="input_minio_env_prd"></a> [minio\_env\_prd](#input\_minio\_env\_prd) | Environment for MinIO prd | `string` | n/a | yes |
| <a name="input_minio_ingress_domains_prd"></a> [minio\_ingress\_domains\_prd](#input\_minio\_ingress\_domains\_prd) | Domains for MinIO ingress prd | `string` | n/a | yes |
| <a name="input_minio_rootPassword"></a> [minio\_rootPassword](#input\_minio\_rootPassword) | root password for MinIO | `string` | n/a | yes |
| <a name="input_minio_rootUser"></a> [minio\_rootUser](#input\_minio\_rootUser) | root user for MinIO | `string` | n/a | yes |
| <a name="input_minio_user1_accessKey"></a> [minio\_user1\_accessKey](#input\_minio\_user1\_accessKey) | Access key for MinIO user1 | `string` | n/a | yes |
| <a name="input_minio_user1_name"></a> [minio\_user1\_name](#input\_minio\_user1\_name) | User name for MinIO user1 | `string` | n/a | yes |
| <a name="input_minio_user1_password"></a> [minio\_user1\_password](#input\_minio\_user1\_password) | User password for MinIO user1 | `string` | n/a | yes |
| <a name="input_minio_user1_policy"></a> [minio\_user1\_policy](#input\_minio\_user1\_policy) | User policy for MinIO user1 | `string` | n/a | yes |
| <a name="input_minio_user1_secretKey"></a> [minio\_user1\_secretKey](#input\_minio\_user1\_secretKey) | Secret key for MinIO user1 | `string` | n/a | yes |
| <a name="input_nextcloud_admin_password"></a> [nextcloud\_admin\_password](#input\_nextcloud\_admin\_password) | Admin password for Nextcloud | `string` | n/a | yes |
| <a name="input_nextcloud_admin_username"></a> [nextcloud\_admin\_username](#input\_nextcloud\_admin\_username) | Admin username for Nextcloud | `string` | n/a | yes |
| <a name="input_nextcloud_mail_domain"></a> [nextcloud\_mail\_domain](#input\_nextcloud\_mail\_domain) | n/a | `string` | n/a | yes |
| <a name="input_nextcloud_postgresql_admin_password"></a> [nextcloud\_postgresql\_admin\_password](#input\_nextcloud\_postgresql\_admin\_password) | n/a | `string` | n/a | yes |
| <a name="input_nextcloud_postgresql_database"></a> [nextcloud\_postgresql\_database](#input\_nextcloud\_postgresql\_database) | n/a | `string` | n/a | yes |
| <a name="input_nextcloud_postgresql_user_password"></a> [nextcloud\_postgresql\_user\_password](#input\_nextcloud\_postgresql\_user\_password) | n/a | `string` | n/a | yes |
| <a name="input_nextcloud_postgresql_username"></a> [nextcloud\_postgresql\_username](#input\_nextcloud\_postgresql\_username) | n/a | `string` | n/a | yes |
| <a name="input_nextcloud_prd_domain"></a> [nextcloud\_prd\_domain](#input\_nextcloud\_prd\_domain) | Domain for Nextcloud prd | `string` | n/a | yes |
| <a name="input_nextcloud_prd_env"></a> [nextcloud\_prd\_env](#input\_nextcloud\_prd\_env) | Environment for Nextcloud prd | `string` | n/a | yes |
| <a name="input_nextcloud_prd_ip_address"></a> [nextcloud\_prd\_ip\_address](#input\_nextcloud\_prd\_ip\_address) | IP address for Nextcloud prd staging service | `string` | n/a | yes |
| <a name="input_nextcloud_prd_mail_fromaddress"></a> [nextcloud\_prd\_mail\_fromaddress](#input\_nextcloud\_prd\_mail\_fromaddress) | n/a | `string` | n/a | yes |
| <a name="input_nextcloud_proxies"></a> [nextcloud\_proxies](#input\_nextcloud\_proxies) | Proxy addresses for Nextcloud | `string` | n/a | yes |
| <a name="input_nextcloud_redis_password"></a> [nextcloud\_redis\_password](#input\_nextcloud\_redis\_password) | n/a | `string` | n/a | yes |
| <a name="input_nextcloud_smtp_host"></a> [nextcloud\_smtp\_host](#input\_nextcloud\_smtp\_host) | n/a | `string` | n/a | yes |
| <a name="input_nextcloud_smtp_password"></a> [nextcloud\_smtp\_password](#input\_nextcloud\_smtp\_password) | n/a | `string` | n/a | yes |
| <a name="input_nextcloud_smtp_username"></a> [nextcloud\_smtp\_username](#input\_nextcloud\_smtp\_username) | n/a | `string` | n/a | yes |
| <a name="input_rsync_dst_folder_path"></a> [rsync\_dst\_folder\_path](#input\_rsync\_dst\_folder\_path) | Destination folder path for rsync cronjob | `string` | n/a | yes |
| <a name="input_rsync_dst_ip_address"></a> [rsync\_dst\_ip\_address](#input\_rsync\_dst\_ip\_address) | Destination ip address for rsync cronjob | `string` | n/a | yes |
| <a name="input_rsync_src_folder_path"></a> [rsync\_src\_folder\_path](#input\_rsync\_src\_folder\_path) | Source folder path for rsync cronjob | `string` | n/a | yes |
| <a name="input_rsync_username"></a> [rsync\_username](#input\_rsync\_username) | Username for rsync cronjob | `string` | n/a | yes |
| <a name="input_server"></a> [server](#input\_server) | machine which will run the control plane | <pre>object({<br/>    host        = string,<br/>    user        = string,<br/>    private_key = string,<br/>  })</pre> | n/a | yes |
| <a name="input_sftp_ip_address"></a> [sftp\_ip\_address](#input\_sftp\_ip\_address) | IP address for SFTP service | `string` | n/a | yes |
| <a name="input_telegram_bot_token"></a> [telegram\_bot\_token](#input\_telegram\_bot\_token) | Bot token for Telegram | `string` | n/a | yes |
| <a name="input_telegram_chat_id"></a> [telegram\_chat\_id](#input\_telegram\_chat\_id) | Chat id for Telegram | `string` | n/a | yes |
| <a name="input_victoriametrics_alertmanager_domains"></a> [victoriametrics\_alertmanager\_domains](#input\_victoriametrics\_alertmanager\_domains) | Domains for VictoriaMetrics Alertmanager ingress prd | `string` | n/a | yes |
| <a name="input_victoriametrics_env_prd"></a> [victoriametrics\_env\_prd](#input\_victoriametrics\_env\_prd) | Environment for VictoriaMetrics prd | `string` | n/a | yes |
| <a name="input_victoriametrics_grafana_admin_password"></a> [victoriametrics\_grafana\_admin\_password](#input\_victoriametrics\_grafana\_admin\_password) | admin password for VictoriaMetrics | `string` | n/a | yes |
| <a name="input_victoriametrics_grafana_admin_user"></a> [victoriametrics\_grafana\_admin\_user](#input\_victoriametrics\_grafana\_admin\_user) | admin user for VictoriaMetrics | `string` | n/a | yes |
| <a name="input_victoriametrics_grafana_domains"></a> [victoriametrics\_grafana\_domains](#input\_victoriametrics\_grafana\_domains) | Domains for VictoriaMetrics Grafana ingress prd | `string` | n/a | yes |
| <a name="input_victoriametrics_vmagent_domains"></a> [victoriametrics\_vmagent\_domains](#input\_victoriametrics\_vmagent\_domains) | Domains for VictoriaMetrics VMAgent ingress prd | `string` | n/a | yes |
| <a name="input_victoriametrics_vmalert_domains"></a> [victoriametrics\_vmalert\_domains](#input\_victoriametrics\_vmalert\_domains) | Domains for VictoriaMetrics VMAlert ingress prd | `string` | n/a | yes |
| <a name="input_victoriametrics_vmsingle_domains"></a> [victoriametrics\_vmsingle\_domains](#input\_victoriametrics\_vmsingle\_domains) | Domains for VictoriaMetrics VMSingle ingress prd | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
