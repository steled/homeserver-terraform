variable "token" {
  type        = string
  description = "Secret key for Authentik prd"
}

variable "grafana_client_id" {
  type = string
}

variable "grafana_client_secret" {
  type = string
}

variable "authentik_url" {
  type = string
}

variable "grafana_allowed_redirect_uris" {
  type = string
}
