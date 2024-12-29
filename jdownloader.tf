module "jdownloader" {
  source = "git@github.com:steled/terraformmodules.git//jdownloader?ref=v0.8"
  # source = "../terraformmodules/jdownloader/"

  ssh_user = var.server.user
  ssh_host = var.server.host

  # renovate: datasource=github-tags depName=sftp-server packageName=steled/sftp-server
  sftp_version          = "https://github.com/steled/sftp-server/archive/refs/tags/v0.3.12.tar.gz" # check version here: https://github.com/steled/sftp-server/tags
  namespace             = "jd-sftp"
  env_jd_devicename     = var.jdownloader_env_jd_devicename
  env_jd_email          = var.jdownloader_env_jd_email
  env_jd_password       = var.jdownloader_env_jd_password
  sftp_values_yaml      = "${path.root}/sftp-values.yaml"
  sftp_ip_address       = var.sftp_ip_address
  rsync_upload_id_rsa   = "${path.root}/files/ssh-keys/upload.id_rsa"
  rsync_dst_ip_address  = var.rsync_dst_ip_address
  rsync_dst_folder_path = var.rsync_dst_folder_path
  rsync_username        = var.rsync_username
  rsync_src_folder_path = var.rsync_src_folder_path

  # sftp_values_yaml  = [ templatefile("${path.root}/sftp-values.yaml", {
  #   sftp_ip_address = var.sftp_ip_address
  # })]

  # depends_on = [ ssh_resource.install_k3s ]
}
