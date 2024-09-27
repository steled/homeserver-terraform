module "jdownloader" {
  source="git@github.com:steled/terraformmodules.git//jdownloader?ref=modules"
  # source = "../terraformmodules/jdownloader/"

  ssh_user          = var.server.user
  ssh_host          = var.server.host

  namespace         = "jd-sftp"
  env_JD_DEVICENAME = "k8s"
  env_JD_EMAIL      = "jbo1@gmx.de"
  env_JD_PASSWORD   = "Sneaker1"
  sftp_values_yaml  = "sftp-values.yaml"

  # depends_on = [ ssh_resource.install_k3s ]
}
