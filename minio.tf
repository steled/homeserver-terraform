module "minio" {
  source = "git@github.com:steled/terraformmodules.git//minio?ref=v0.11"
  # source = "../terraformmodules/minio/"

  # renovate: depName=minio registryUrl=https://charts.min.io/
  minio_version             = "5.4.0" # check version here: https://github.com/minio/minio/blob/master/helm/minio/Chart.yaml#L4
  kubernetes_namespace_name = "minio"
  ingress_domains           = var.minio_ingress_domains_prd
  console_ingress_domains   = var.minio_console_ingress_domains_prd
  environment               = var.minio_env_prd
  rootUser                  = var.minio_rootUser
  rootPassword              = var.minio_rootPassword
  user1_name                = var.minio_user1_name
  user1_password            = var.minio_user1_password
  user1_policy              = var.minio_user1_policy
  user1_secretKey           = var.minio_user1_secretKey
  user1_accessKey           = var.minio_user1_accessKey
  values_yaml               = "${path.root}/helm-values/minio.yaml"

  depends_on = [module.cert_manager_cloudflare]
}
