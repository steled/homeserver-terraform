locals {
  # renovate: datasource=github-tags depName=sftp-server packageName=steled/sftp-server
  sftp_version = "v0.3.13"
}

module "jdownloader" {
  source = "git@github.com:steled/terraformmodules.git//jdownloader?ref=v0.12"
  # source = "../terraformmodules/jdownloader/"

  ssh_user = var.server.user
  ssh_host = var.server.host

  sftp_chart            = "https://github.com/steled/sftp-server/archive/refs/tags/${local.sftp_version}.tar.gz" # check version here: https://github.com/steled/sftp-server/tags
  namespace             = "jd-sftp"
  env_jd_devicename     = var.jdownloader_env_jd_devicename
  env_jd_email          = var.jdownloader_env_jd_email
  env_jd_password       = var.jdownloader_env_jd_password
  sftp_values_yaml      = "${path.root}/helm-values/sftp.yaml"
  sftp_ip_address       = var.sftp_ip_address
  rsync_upload_id_rsa   = "${path.root}/files/ssh-keys/upload.id_rsa"
  rsync_dst_ip_address  = var.rsync_dst_ip_address
  rsync_dst_folder_path = var.rsync_dst_folder_path
  rsync_username        = var.rsync_username
  rsync_src_folder_path = var.rsync_src_folder_path
}
