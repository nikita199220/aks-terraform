resource "azurerm_resource_group" "K8s" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "K8s" {
  name       = var.cluster_name
  location   = "${azurerm_resource_group.K8s.location}"
  resource_group_name = "${azurerm_resource_group.K8s.name}"
  dns_prefix = var.dns_prefix
  
  agent_pool_profile {
    name                = var.cluster_name
    count               = var.agent_count
    vm_size             = "Standard_A3"
    os_type             = "Linux"
  }

  tags = {
  Environment = "Production"
  }
}
output "kube_config" {
  value = azurerm_kubernetes_cluster.K8s.kube_config_raw
}