# module "ingress" {
#   # source = "git@github.com:steled/terraformmodules.git//ingress?ref=modules"
#   source = "../terraformmodules/ingress/"

#   namespace          = "ingress"
#   ingress_version    = "4.2.5" # check version here: https://github.com/kubernetes/ingress-nginx/blob/master/charts/ingress-nginx/Chart.yaml
#   values_yaml        = "${path.root}/ingress-values.yaml"
#   ingress_ip_address = var.ingress_ip_address
#   # values_yaml     = [ templatefile("${path.root}/ingress-values.yaml", {
#   #   ingress_ip_address = var.ingress_ip_address
#   # })]

#   # depends_on = [ ssh_resource.install_k3s ]
# }
