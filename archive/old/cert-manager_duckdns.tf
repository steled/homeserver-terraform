module "cert_manager_duckdns" {
  # source = "git@github.com:steled/terraformmodules.git//cert-manager_duckdns?ref=modules"
  source = "../terraformmodules/cert-manager_duckdns/"

  namespace            = "cert-manager"
  cert_manager_version = "v1.16.1" # check version here: https://artifacthub.io/packages/helm/cert-manager/cert-manager/
  # duckdns_webhook_version     = "1.4.7" # check version here: https://github.com/steled/cert-manager-webhook-duckdns/blob/master/charts/cert-manager-webhook-duckdns/Chart.yaml#L4
  duckdns_webhook_version     = "1.1.3" # check version here: https://github.com/csp33/cert-manager-duckdns-webhook/blob/master/charts/cert-manager-duckdns-webhook/Chart.yaml#L5
  duckdns_webhook_values_yaml = "${path.root}/duckdns-webhook-values.yaml"
  duckdns_webhook_ip_address  = var.duckdns_webhook_ip_address
}
