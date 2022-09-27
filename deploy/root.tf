terraform {
  required_version = ">= 1.2.7"
  backend "local" {

  }
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


resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "eastus"
}

module "terraform-azure-lga-workspace" {
  source              = "./modules/terraform-azure-lga-workspace"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  sku                 = "PerGB2018"
}