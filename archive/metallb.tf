module "metallb" {
  # source="git@github.com:steled/terraformmodules.git//metallb?ref=modules"
  source = "../terraformmodules/metallb/"

  namespace       = "metallb"
  metallb_version = "v0.14.5" # check version here: https://github.com/metallb/metallb/blob/v0.14.5/charts/metallb/Chart.yaml#L44
  # helm_values_addresses = "- 172.22.235.30-172.22.235.45"
  helm_values_addresses = "- 172.23.184.30-172.23.184.45"
  values_yaml           = "metallb-values.yaml"

  depends_on = [ssh_resource.install_k3s]
}
