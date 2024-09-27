module "cert-manager" {
  source = "git@github.com:steled/terraformmodules.git//cert-manager?ref=modules"
  # source = "../terraformmodules/cert-manager/"

  namespace                   = "cert-manager"
  cert_manager_version        = "v1.15.1" # check version here: https://artifacthub.io/packages/helm/cert-manager/cert-manager/
  duckdns_webhook_version     = "1.4.5" # check version here: https://github.com/steled/cert-manager-webhook-duckdns/blob/master/charts/cert-manager-webhook-duckdns/Chart.yaml#L4
  duckdns_webhook_values_yaml = "duckdns-webhook-values.yaml"

  # depends_on = [ ssh_resource.install_k3s ]
}
