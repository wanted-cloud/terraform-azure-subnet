data "azurerm_nat_gateway" "this" {
  count               = (var.nat_gateway != "") ? 1 : 0
  name                = var.nat_gateway
  resource_group_name = (var.nat_gateway_resource_group_name != "") ? var.nat_gateway_resource_group_name : var.resource_group_name
}

resource "azurerm_subnet_nat_gateway_association" "this" {
  count          = (var.nat_gateway != "") ? 1 : 0
  subnet_id      = azurerm_subnet.this.id
  nat_gateway_id = data.azurerm_nat_gateway.this[0].id

  timeouts {
    create = try(
      local.metadata.resource_timeouts["azurerm_subnet_nat_gateway_association"]["create"],
      local.metadata.resource_timeouts["default"]["create"]
    )
    read = try(
      local.metadata.resource_timeouts["azurerm_subnet_nat_gateway_association"]["read"],
      local.metadata.resource_timeouts["default"]["read"]
    )
    delete = try(
      local.metadata.resource_timeouts["azurerm_subnet_nat_gateway_association"]["delete"],
      local.metadata.resource_timeouts["default"]["delete"]
    )
  }
}