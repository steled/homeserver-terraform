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
  blocks:
  - cidr: "172.28.155.0/24"
YAML

  # depends_on = [ time_sleep.wait_30_seconds ]
}
