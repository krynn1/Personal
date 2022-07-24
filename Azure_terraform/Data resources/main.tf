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
    subscription_id = "b756ec64-dce1-4cc9-8177-beabd296d707"
    tenant_id = "62ab0a74-ae0c-4d65-b20e-24e6c99966a9"
}
}

provider "azurerm" {

  features {}

}
