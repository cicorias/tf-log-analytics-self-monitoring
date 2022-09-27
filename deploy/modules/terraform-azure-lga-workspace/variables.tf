variable "resource_group_name" {
  description = "The name of the resource group in which to create the log analytics workspace."
  type        = string
}

variable "location" {
  description = "The Azure Region in which to create the log analytics workspace."
  type        = string
}

variable "sku" {
  description = "The SKU of the workspace."
  type        = string
  validation {
    condition     = contains(["free", "PerGB2018"], var.sku)
    error_message = "The SKU must be either 'free' or 'pergb2018'."
  }

}