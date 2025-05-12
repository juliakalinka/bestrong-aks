# BestrongAKS Terraform Infrastructure

This repository contains Terraform code for provisioning and managing an Azure Kubernetes Service (AKS) cluster with associated resources.

## Infrastructure Overview

The Terraform code provisions the following Azure resources:

1. **Resource Group**: A container that holds all resources for the AKS cluster
2. **Azure Container Registry (ACR)**: For storing Docker container images
3. **AKS Cluster**: A managed Kubernetes cluster with configured node pool
4. **Role Assignment**: Grants the AKS cluster permission to pull images from the ACR
5. **Public IP**: Allocated for the Ingress controller

## Prerequisites

- [Terraform](https://www.terraform.io/) (version ~> 1.5)
- Azure subscription
- Azure service principal with required permissions

## Configuration Files

- **main.tf**: Contains the main resource definitions
- **variables.tf**: Defines input variables
- **providers.tf**: Specifies required providers and their versions
- **outputs.tf**: Defines output values exposed after deployment
- **terraform.tfvars**: Contains the values for variables (sensitive information)

## Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `location` | Azure region for deployment | West Europe |
| `cluster_name` | Name of the AKS cluster | bestrongAKS |
| `dns_prefix` | DNS prefix for the AKS cluster | bestrong |
| `agent_count` | Number of nodes in the default node pool | 2 |
| `vm_size` | VM size for the nodes | Standard_B2s |
| `SSH_PUBLIC_KEY` | SSH public key for node access | - |
| `ARM_CLIENT_ID` | Azure service principal client ID | - |
| `ARM_CLIENT_SECRET` | Azure service principal client secret | - |
| `ARM_TENANT_ID` | Azure tenant ID | - |
| `ARM_SUBSCRIPTION_ID` | Azure subscription ID | - |

## Deployment

1. Initialize Terraform:
   ```bash
   terraform init
   ```

2. Review the execution plan:
   ```bash
   terraform plan
   ```

3. Apply the changes:
   ```bash
   terraform apply
   ```

## Outputs

After successful deployment, the following outputs are available:

- `resource_group_name`: Name of the created resource group
- `aks_cluster_name`: Name of the AKS cluster
- `acr_name`: Name of the Azure Container Registry
- `kube_config`: Kubernetes configuration for connecting to the cluster
- `host`: Kubernetes API server endpoint
- `ingress_ip_address`: Public IP address for the Ingress controller

## Security Note

The `terraform.tfvars` file contains sensitive information and should not be committed to version control. Consider using environment variables or a secure secret management solution instead. 