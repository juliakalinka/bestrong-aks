resource "azurerm_resource_group" "rg" {
  name     = "${var.cluster_name}-rg"
  location = var.location
}

resource "azurerm_container_registry" "acr" {
  name                = "${var.cluster_name}acr"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Standard"
  admin_enabled       = true
}

resource "azurerm_kubernetes_cluster" "k8s" {
  name                = var.cluster_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name            = "agentpool"
    node_count      = var.agent_count
    vm_size         = var.vm_size
    os_disk_size_gb = 30
  }

  identity {
    type = "SystemAssigned"
  }

 linux_profile {
    admin_username = "azureuser"
    ssh_key {
      key_data = var.SSH_PUBLIC_KEY
    }
  }

  network_profile {
    network_plugin     = "kubenet"
    load_balancer_sku  = "standard"
    outbound_type      = "loadBalancer"
  }

  depends_on = [azurerm_container_registry.acr]

  tags = {
    Environment = "Development"
  }
}

resource "azurerm_role_assignment" "acr_pull" {
  principal_id                     = azurerm_kubernetes_cluster.k8s.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr.id
  skip_service_principal_aad_check = true
}

resource "azurerm_public_ip" "ingress_ip" {
  name                = "${var.cluster_name}-ingress-ip"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"
  sku                 = "Standard"
  
  tags = {
    Environment = "Development"
  }
}

# Ingress public IP
