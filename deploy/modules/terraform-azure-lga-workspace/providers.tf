terraform {
  required_version = ">= 1.2.7"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.21.1"
    }
    azapi = {
      source  = "Azure/azapi"
      version = ">=0.4.0"
    }
  }
}
