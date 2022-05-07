resource "azurerm_subnet" "subnet" {
  name                 = "appservicesubnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/28"]

  service_endpoints = ["Microsoft.KeyVault", "Microsoft.Sql", "Microsoft.Web"]
  delegation {
    name = "delegation"

    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }
}
resource "azurerm_subnet" "app_private_endpoint_subnet" {
  name                                           = "appprivateendpoint"
  resource_group_name                            = azurerm_resource_group.rg.name
  virtual_network_name                           = azurerm_virtual_network.vnet.name
  address_prefixes                               = ["10.0.2.0/28"]
  enforce_private_link_endpoint_network_policies = false
  service_endpoints                              = ["Microsoft.KeyVault", "Microsoft.Sql", "Microsoft.Web"]

}
resource "azurerm_subnet" "lb_private_endpoint_subnet" {
  name                 = "lbprivateendpoint"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.3.0/28"]

  service_endpoints = ["Microsoft.KeyVault", "Microsoft.Sql", "Microsoft.Web"]

}
 