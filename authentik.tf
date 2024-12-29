# module "authentik" {
#   source = "git@github.com:steled/terraformmodules.git//authentik?ref=v0.8"
#   # source = "../terraformmodules/authentik/"

#   authentik_version            = "2024.12.0" # check version here: https://github.com/goauthentik/helm/blob/main/charts/authentik/Chart.yaml#L3
#   kubernetes_namespace_name    = "authentik"
#   environment                  = var.authentik_env_prd
#   authentik_domains            = var.authentik_domains
#   authentik_secret_key         = var.authentik_secret_key
#   postgresql_password          = var.authentik_postgresql_password
#   authentik_bootstrap_password = var.authentik_bootstrap_password
#   authentik_bootstrap_token    = var.authentik_bootstrap_token
#   authentik_bootstrap_email    = var.authentik_bootstrap_email

#   depends_on = [module.cert_manager_cloudflare]
# }

# module "authentik_applications" {
#   source = "./authentik_applications/"

#   token                         = var.authentik_bootstrap_token
#   grafana_client_id             = var.authentik_grafana_client_id
#   grafana_client_secret         = var.authentik_grafana_client_secret
#   authentik_url                 = var.authentik_url
#   grafana_allowed_redirect_uris = var.grafana_allowed_redirect_uris

#   # depends_on = [module.authentik]
# }
