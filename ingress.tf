module "ingress" {
  source = "git@github.com:steled/terraformmodules.git//ingress?ref=modules"

  namespace       = "ingress"
  ingress_version = "4.2.5" # check version here: https://github.com/kubernetes/ingress-nginx/blob/master/charts/ingress-nginx/Chart.yaml
  values_yaml     = "ingress-values.yaml"

  # depends_on = [ ssh_resource.install_k3s ]
}
