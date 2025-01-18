module "hassio" {
  source = "git@github.com:steled/terraformmodules.git//hassio?ref=v0.11"
  # source = "../terraformmodules/hassio/"

  ssh_user = var.server.user
  ssh_host = var.server.host

  namespace   = "hassio"
  host        = var.hassio_domain
  ip          = var.hassio_ip_address
  environment = var.hassio_env

  depends_on = [module.cert_manager_cloudflare]
}

#     nginx.org/server-snippets: |2
#               location / {
#                 proxy_set_header Host $host;
#                 proxy_redirect http:// https://;
#                 proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
#                 proxy_set_header Upgrade $http_upgrade;
#                 proxy_set_header Connection $connection_upgrade;
#               }
