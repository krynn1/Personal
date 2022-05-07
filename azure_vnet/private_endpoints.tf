
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