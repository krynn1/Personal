resource "azurerm_service_plan" "plan" {
  name                = var.name
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

resource "azurerm_resource_group" "rg" {
  name     = "jfordrg"
  location = var.location
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = ["10.0.0.0/16"]

}
resource "azurerm_private_endpoint" "example" {
  name                = "jford-endpoint"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  subnet_id           = azurerm_subnet.app_private_endpoint_subnet.id

  private_service_connection {
    is_manual_connection           = false
    name                           = "jford-connection"
    private_connection_resource_id = azurerm_windows_web_app.app.id
    subresource_names              = ["sites"]
  }
}