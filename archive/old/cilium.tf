# the repo needs to be added before running:
# helm repo add cilium https://helm.cilium.io/

module "cilium" {
  source="git@github.com:isovalent/terraform-k8s-cilium.git?ref=v1.6.5" # get version from here: https://github.com/isovalent/terraform-k8s-cilium/releases

  cilium_helm_values_file_path          = "./cilium-values.yaml" # get version specific from here: https://github.com/cilium/cilium/blob/main/install/kubernetes/cilium/values.yaml
  cilium_helm_values_override_file_path = "./cilium-values-override.yaml"
  cilium_helm_version                   = "1.15.7" # get version from here: https://github.com/cilium/charts
  path_to_kubeconfig_file               = "/home/steled/.kube/config"
  total_control_plane_nodes             = 1

  # depends_on = [ ssh_resource.install_k3s ]
}
