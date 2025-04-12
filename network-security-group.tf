data "azurerm_network_security_group" "this" {
  count               = (var.network_security_group != "") ? 1 : 0
  name                = var.network_security_group
  resource_group_name = (var.network_security_group_resource_group_name != "") ? var.network_security_group_resource_group_name : var.resource_group_name
}

resource "azurerm_subnet_network_security_group_association" "this" {
  count                     = (var.network_security_group != "") ? 1 : 0
  subnet_id                 = azurerm_subnet.this.id
  network_security_group_id = data.azurerm_network_security_group.this[0].id

  timeouts {
    create = try(
      local.metadata.resource_timeouts["azurerm_subnet_network_security_group_association"]["create"],
      local.metadata.resource_timeouts["default"]["create"]
    )
    read = try(
      local.metadata.resource_timeouts["azurerm_subnet_network_security_group_association"]["read"],
      local.metadata.resource_timeouts["default"]["read"]
    )
    delete = try(
      local.metadata.resource_timeouts["azurerm_subnet_network_security_group_association"]["delete"],
      local.metadata.resource_timeouts["default"]["delete"]
    )
  }
}