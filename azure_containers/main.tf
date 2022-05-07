# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      // version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "jfordrg"
  location = "centralus"
}

resource "azurerm_container_group" "acg" {
  name                = "jfordtest1234-label"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  ip_address_type     = "Public"
  dns_name_label      = "jfordtest1234-label"
  os_type             = "Linux"

  container {
    name                  = "hw"
    image                 = "mcr.microsoft.com/azuredocs/aci-helloworld"
    cpu                   = "0.5"
    memory                = "1.5"
    environment_variables = { PORT = "443" }

    ports {
      port     = 443
      protocol = "TCP"
    }

  }

  tags = {
    environment = "testing"
  }
}