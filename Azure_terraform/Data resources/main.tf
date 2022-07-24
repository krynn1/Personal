terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.13.0"
    }
  }
   backend "azurerm" {
    resource_group_name  = "jford-test"
    storage_account_name = "tfstate12345632"
    container_name       = "tfstate"
    key = "data.tfstate"
    subscription_id = var.ARM_SUBSCRIPTION_ID
    tenant_id = var.ARM_TENANT_ID
}
}

provider "azurerm" {

  features {}

}
