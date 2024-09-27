variable "server" {
  description = "machine which will run the control plane"
  type = object({
    host = string,
    user = string,
    private_key = string,
  })
}

# variable "k3s" {
#   type = object({
#     download_url = optional(string),
#     version = optional(string),
#   })
#   default = {}
# }
