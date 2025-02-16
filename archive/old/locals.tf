locals {
  k3s = coalesce({
    download_url = "https://get.k3s.io",
    version      = "v1.30.1+k3s1" # get version from here: https://github.com/k3s-io/k3s/releases
  }, var.k3s)
}
