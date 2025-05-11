variable "location" {
  default = "West Europe"
}

variable "cluster_name" {
  default = "bestrong-aks"
}

variable "dns_prefix" {
  default = "bestrong"
}

variable "agent_count" {
  default = 2
}

variable "vm_size" {
  default = "Standard_B2s"
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key"
}

variable "client_id" {}
variable "client_secret" {}
variable "subscription_id" {}
variable "tenant_id" {}