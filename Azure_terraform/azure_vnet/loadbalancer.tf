/*resource "azurerm_lb" "example" {
  name                = "TestLoadBalancer"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  frontend_ip_configuration {
    name = "test"
    subnet_id = azurerm_subnet.lb_private_endpoint_subnet.id
  }
}*/