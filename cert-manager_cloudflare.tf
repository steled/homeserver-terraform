module "cert_manager_cloudflare" {
  source = "git@github.com:steled/terraformmodules.git//cert-manager_cloudflare?ref=v0.8"
  # source = "../terraformmodules/cert-manager_cloudflare/"

  namespace            = "cert-manager"
  # renovate: datasource=github-tags depName=cert-manager packageName=cert-manager/cert-manager
  cert_manager_version = "v1.16.1" # check version here: https://artifacthub.io/packages/helm/cert-manager/cert-manager/
  cloudflare_api_token = var.cloudflare_api_token
  cert_manager_email   = var.cert_manager_email
}
