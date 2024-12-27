module "victoriametrics" {
  source = "git@github.com:steled/terraformmodules.git//victoriametrics?ref=v0.7"
  # source = "../terraformmodules/victoriametrics/"

  victoriametrics_version   = "0.33.0" # check version here: https://github.com/VictoriaMetrics/helm-charts/blob/51a8e2dd98d78611b9772ff6632c2ef67cc681bb/charts/victoria-metrics-k8s-stack/Chart.yaml#L5
  kubernetes_namespace_name = "victoriametrics"
  vmsingle_domains          = var.victoriametrics_vmsingle_domains
  alertmanager_domains      = var.victoriametrics_alertmanager_domains
  vmalert_domains           = var.victoriametrics_vmalert_domains
  vmagent_domains           = var.victoriametrics_vmagent_domains
  grafana_domains           = var.victoriametrics_grafana_domains
  environment               = var.victoriametrics_env_prd
  grafana_admin_user        = var.victoriametrics_grafana_admin_user
  grafana_admin_password    = var.victoriametrics_grafana_admin_password
  grafana_client_id         = var.authentik_grafana_client_id
  grafana_client_secret     = var.authentik_grafana_client_secret

  depends_on = [module.cert_manager_cloudflare]
}
