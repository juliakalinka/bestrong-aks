terraform { 
 required_version = "~> 1.5" 
 required_providers { 
   azapi = { 
     source  = "azure/azapi" 
     version = "~> 2.0" 
   } 
   azurerm = { 
    source  = "hashicorp/azurerm" 
    version = "~> 4.0" 
   } 
  }
 }

provider "azurerm" {
  features {}

  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}