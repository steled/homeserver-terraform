module "apprise" {
  source = "git@github.com:steled/terraformmodules.git//apprise?ref=v0.12"
  # source = "../terraformmodules/apprise/"

  # renovate: datasource=docker depName=apprise packageName=caronc/apprise
  apprise_version             = "1.1.8" # check version here: https://registry.hub.docker.com/r/caronc/apprise/tags
  kubernetes_namespace_name   = "apprise"
  apprise_api_htpasswd_secret = var.apprise_api_htpasswd_secret
  environment                 = var.apprise_env_prd
  domain                      = var.apprise_domain

  depends_on = [module.cert_manager_cloudflare]
}
