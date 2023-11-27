resource "ssh_resource" "files" {
  for_each = local.servers
  host     = each.value.host
  user     = each.value.user
  # agent    = true

  file {
    source      = "files/crontab"
    destination = "/tmp/steled-crontab"
    permissions = "0755"
    owner       = "steled"
    group       = "steled"
  }

  file {
    source = "files/preparation.sh"
    destination = "/tmp/preparation.sh"
    permissions = "0755"
    owner       = "steled"
    group       = "steled"
  }

  commands = [ 
    "crontab /tmp/steled-crontab",
    "/tmp/preparation.sh"
  ]

  private_key = file(each.value.private_key)
  timeout = "10m"
}
