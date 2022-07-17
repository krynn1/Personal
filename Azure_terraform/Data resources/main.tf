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
}
}

provider "azurerm" {

  features {}
  subscription_id = "b756ec64-dce1-4cc9-8177-beabd296d707"
  client_id = "dd855e16-55ab-4d85-86f5-2ec03a538dca"
  client_secret = "jiX8Q~LVCbg.sFcFmkoGuDIG2HKFNxw4iW61rbbm"
  tenant_id = "62ab0a74-ae0c-4d65-b20e-24e6c99966a9"

}