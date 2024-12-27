terraform {
  required_version = ">=1.3.0"

  required_providers {
    authentik = {
      source  = "goauthentik/authentik"
      version = "2024.10.2"
    }
  }
}

provider "authentik" {
  url   = var.authentik_url
  token = var.token
  # Optionally set insecure to ignore TLS Certificates
  insecure = true
}
