locals {
  k3s = coalesce({
    download_url = "https://get.k3s.io",
    version = "v1.28.3+k3s2"
  }, var.k3s)

  servers = {for server in var.servers : server.host => server}
}
