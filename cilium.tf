# resource "time_sleep" "wait_30_seconds" {
#   create_duration = "30s"

#   depends_on = [ module.cilium ]
# }

resource "kubectl_manifest" "ciliumloadbalancerippool" {
    yaml_body = <<YAML
apiVersion: cilium.io/v2alpha1
kind: CiliumLoadBalancerIPPool
metadata:
  name: "blue-pool"
spec:
  allowFirstLastIPs: "No"
  blocks:
  - cidr: ${var.cilium_cidr}
YAML

  # depends_on = [ time_sleep.wait_30_seconds ]
}

resource "kubectl_manifest" "ciliuml2announcementpolicy" {
    yaml_body = <<YAML
apiVersion: "cilium.io/v2alpha1"
kind: CiliumL2AnnouncementPolicy
metadata:
  name: policy1
spec:
  interfaces:
  - ^eth[0-9]+
  externalIPs: true
  loadBalancerIPs: true
YAML
}
