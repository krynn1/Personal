resource "azurerm_service_plan" "plan" {
  name                = "jfordapptestplan"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  sku_name            = "S1"
  os_type             = "Windows"
}

resource "azurerm_windows_web_app" "app" {
  name                = "jfordapp"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_service_plan.plan.location
  service_plan_id     = azurerm_service_plan.plan.id

  site_config {
    vnet_route_all_enabled = true
  }
  identity {
    type = "SystemAssigned"
  }

}
resource "azurerm_app_service_virtual_network_swift_connection" "app" {
  app_service_id = azurerm_windows_web_app.app.id
  subnet_id      = azurerm_subnet.subnet.id
}

resource "azurerm_network_security_group" "example" {
  name                = "vnet-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Production"
  }
}
resource "azurerm_subnet_network_security_group_association" "example" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.example.id
}