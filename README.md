# homeserver-terraform
Repository for HomeServer install/config via Terraform

source: https://github.com/mrsauravsahu/kube-homelab/tree/main

# TF Docs

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.3.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | ~> 2.16.1 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | ~> 2.1.3 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.35.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubectl"></a> [kubectl](#provider\_kubectl) | ~> 2.1.3 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | ~> 2.35.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cert_manager_cloudflare"></a> [cert\_manager\_cloudflare](#module\_cert\_manager\_cloudflare) | git@github.com:steled/terraformmodules.git//cert-manager_cloudflare | v0.5 |
| <a name="module_hashicorp_vault_staging"></a> [hashicorp\_vault\_staging](#module\_hashicorp\_vault\_staging) | git@github.com:steled/terraformmodules.git//hashicorp-vault | v0.5 |
| <a name="module_hassio"></a> [hassio](#module\_hassio) | git@github.com:steled/terraformmodules.git//hassio | v0.5 |
| <a name="module_jdownloader"></a> [jdownloader](#module\_jdownloader) | git@github.com:steled/terraformmodules.git//jdownloader | v0.5 |
| <a name="module_nextcloud"></a> [nextcloud](#module\_nextcloud) | git@github.com:steled/terraformmodules.git//nextcloud | v0.5 |

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
| <a name="input_cert_manager_email"></a> [cert\_manager\_email](#input\_cert\_manager\_email) | Email for cert-mnanager | `string` | n/a | yes |
| <a name="input_cilium_cidr"></a> [cilium\_cidr](#input\_cilium\_cidr) | CIDR range for Cilium loadbalancer IP pool | `string` | n/a | yes |
| <a name="input_cloudflare_api_token"></a> [cloudflare\_api\_token](#input\_cloudflare\_api\_token) | Cloudflare API token for DNS settings | `string` | n/a | yes |
| <a name="input_cloudflare_dns_zone_id"></a> [cloudflare\_dns\_zone\_id](#input\_cloudflare\_dns\_zone\_id) | Cloudflare DNS zone ID | `string` | n/a | yes |
| <a name="input_cloudflare_dnsrecord"></a> [cloudflare\_dnsrecord](#input\_cloudflare\_dnsrecord) | DNS records with IDs | `list(string)` | n/a | yes |
| <a name="input_hashicorp_vault_domain"></a> [hashicorp\_vault\_domain](#input\_hashicorp\_vault\_domain) | Domain for Hashicorp Vault | `string` | n/a | yes |
| <a name="input_hashicorp_vault_env"></a> [hashicorp\_vault\_env](#input\_hashicorp\_vault\_env) | Environment for Hashicorp Vault | `string` | n/a | yes |
| <a name="input_hashicorp_vault_ip_address"></a> [hashicorp\_vault\_ip\_address](#input\_hashicorp\_vault\_ip\_address) | IP address for Hashicorp Vault | `string` | n/a | yes |
| <a name="input_hassio_domain"></a> [hassio\_domain](#input\_hassio\_domain) | Domain for Hassio | `string` | n/a | yes |
| <a name="input_hassio_env"></a> [hassio\_env](#input\_hassio\_env) | Environment for Hassio | `string` | n/a | yes |
| <a name="input_hassio_ip_address"></a> [hassio\_ip\_address](#input\_hassio\_ip\_address) | IP address for Hassio | `string` | n/a | yes |
| <a name="input_jdownloader_env_jd_devicename"></a> [jdownloader\_env\_jd\_devicename](#input\_jdownloader\_env\_jd\_devicename) | n/a | `string` | n/a | yes |
| <a name="input_jdownloader_env_jd_email"></a> [jdownloader\_env\_jd\_email](#input\_jdownloader\_env\_jd\_email) | n/a | `string` | n/a | yes |
| <a name="input_jdownloader_env_jd_password"></a> [jdownloader\_env\_jd\_password](#input\_jdownloader\_env\_jd\_password) | n/a | `string` | n/a | yes |
| <a name="input_nextcloud_admin_password"></a> [nextcloud\_admin\_password](#input\_nextcloud\_admin\_password) | Admin password for Nextcloud | `string` | n/a | yes |
| <a name="input_nextcloud_admin_username"></a> [nextcloud\_admin\_username](#input\_nextcloud\_admin\_username) | Admin username for Nextcloud | `string` | n/a | yes |
| <a name="input_nextcloud_mail_domain"></a> [nextcloud\_mail\_domain](#input\_nextcloud\_mail\_domain) | n/a | `string` | n/a | yes |
| <a name="input_nextcloud_postgresql_database"></a> [nextcloud\_postgresql\_database](#input\_nextcloud\_postgresql\_database) | n/a | `string` | n/a | yes |
| <a name="input_nextcloud_postgresql_password"></a> [nextcloud\_postgresql\_password](#input\_nextcloud\_postgresql\_password) | n/a | `string` | n/a | yes |
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

## Outputs

No outputs.
<!-- END_TF_DOCS -->
