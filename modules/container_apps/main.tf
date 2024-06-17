resource "azurerm_container_group" "container_group" {
  name                = var.container_group_name
  location            = var.location
  resource_group_name = data.azurerm_resource_group.daniel-sandbox12.name
  os_type             = "Linux"

  container {
    name   = var.container_name
    image  = var.image
    cpu    = var.cpu
    memory = var.memory

    ports {
      port     = var.port
      protocol = "TCP"
    }
  }

  tags = {
    environment = "testing"
  }
}


data "azurerm_resource_group" "daniel-sandbox12" {
  name = var.resource_group_name

}