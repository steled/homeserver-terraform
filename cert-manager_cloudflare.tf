module "cert_manager_cloudflare" {
  source = "git@github.com:steled/terraformmodules.git//cert-manager_cloudflare?ref=v0.5"
  # source = "../terraformmodules/cert-manager_cloudflare/"

  namespace            = "cert-manager"
  cert_manager_version = "v1.16.1" # check version here: https://artifacthub.io/packages/helm/cert-manager/cert-manager/
  cloudflare_api_token = var.cloudflare_api_token
  cert_manager_email   = var.cert_manager_email
}
