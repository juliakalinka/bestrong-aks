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
  client_id       = var.ARM_CLIENT_ID
  client_secret   = var.ARM_CLIENT_SECRET
  tenant_id       = var.ARM_TENANT_ID
  subscription_id = var.ARM_SUBSCRIPTION_ID
  
  features {}
}