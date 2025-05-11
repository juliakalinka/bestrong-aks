variable "location" {
  default = "West Europe"
}

variable "cluster_name" {
  default = "bestrongAKS"
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

variable "SSH_PUBLIC_KEY_PATH" {
  description = "Path to the SSH public key"
}

variable "ARM_CLIENT_ID" {
  description = "Azure client ID"
  type        = string
}

variable "ARM_CLIENT_SECRET" {
  description = "Azure client secret"
  type        = string
}

variable "ARM_TENANT_ID" {
  description = "Azure tenant ID"
  type        = string
}

variable "ARM_SUBSCRIPTION_ID" {
  description = "Azure subscription ID"
  type        = string
}