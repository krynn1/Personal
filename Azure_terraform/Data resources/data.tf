data "azurerm_resource_group" "rg" {
  name = "jford-test"
}

resource "azurerm_app_service_plan" "test" {
  location = data.azurerm_resource_group.rg.location
  name = "jfordtest1234566"
  resource_group_name = data.azurerm_resource_group.rg.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "jford-app-service" {
  app_service_plan_id = azurerm_app_service_plan.test.id
  location = data.azurerm_resource_group.rg.location
  name = "jford${var.env}123556"
  resource_group_name = data.azurerm_resource_group.rg.name
}