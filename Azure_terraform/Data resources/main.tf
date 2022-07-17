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
}
}

provider "azurerm" {

  features {}
  

}