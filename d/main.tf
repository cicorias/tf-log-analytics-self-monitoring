terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {}
}

variable "env" {
  type    = string
  default = "d1"
}

variable "vsu_id" {
  type    = string
  default = "1"
}

locals {
  vsu_name = "vsu${var.vsu_id}"
}

resource "azurerm_resource_group" "this" {
  name     = "${var.env}-ag-${local.vsu_name}"
  location = "westus2"

  lifecycle {
    precondition {
      condition     = length("${var.env}-ag-${local.vsu_name}") <= 12
      error_message = "resource group name must be less than or equal to 12 characters"
    }
  }
}

