module "hashicorp_vault" {
  source = "git@github.com:steled/terraformmodules.git//hashicorp-vault?ref=v0.6"
  # source = "../terraformmodules/hashicorp-vault/"

  ssh_user = var.server.user
  ssh_host = var.server.host

  hashicorp_vault_version   = "0.28.1" # check version here: https://github.com/hashicorp/vault-helm/blob/main/Chart.yaml#L6
  kubernetes_namespace_name = "hashicorp-vault"
  hashicorp_vault_domain    = var.hashicorp_vault_domain
  environment               = var.hashicorp_vault_env
  ip_address                = var.hashicorp_vault_ip_address

  depends_on = [module.cert_manager_cloudflare]
}
