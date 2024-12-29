module "longhorn" {
  source = "git@github.com:steled/terraformmodules.git//longhorn?ref=v0.8"
  # source = "../terraformmodules/longhorn/"

  longhorn_version          = "1.7.2" # check version here: https://github.com/longhorn/longhorn/blob/master/chart/Chart.yaml#L3
  kubernetes_namespace_name = "longhorn"
  domain                    = var.longhorn_domain_prd
  environment               = var.longhorn_env_prd

  depends_on = [module.cert_manager_cloudflare]
}
