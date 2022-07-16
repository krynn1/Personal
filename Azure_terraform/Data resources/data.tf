data "azurerm_resource_group" "jford" {
  name = "jford-test"
}


resource "azurerm_service_plan" "example" {
  name                = "appservice-plan"
  resource_group_name = data.azurerm_resource_group.jford.name
  location            = data.azurerm_resource_group.jford.location
  sku_name            = "P1v2"
  os_type             = "Windows"
}

resource "azurerm_windows_web_app" "example" {
  name                = "app-service-1235435"
  resource_group_name = data.azurerm_resource_group.jford.name
  location            = azurerm_service_plan.example.location
  service_plan_id     = azurerm_service_plan.example.id

  site_config {}
}