data "azurerm_route_table" "this" {
  count               = (var.route_table != "") ? 1 : 0
  name                = var.route_table
  resource_group_name = (var.route_table_resource_group_name != "") ? var.route_table_resource_group_name : var.resource_group_name
}

resource "azurerm_subnet_route_table_association" "this" {
  count          = (var.route_table != "") ? 1 : 0
  subnet_id      = azurerm_subnet.this.id
  route_table_id = data.azurerm_route_table.this[0].id

  timeouts {
    create = try(
      local.metadata.resource_timeouts["azurerm_subnet_route_table_association"]["create"],
      local.metadata.resource_timeouts["default"]["create"]
    )
    read = try(
      local.metadata.resource_timeouts["azurerm_subnet_route_table_association"]["read"],
      local.metadata.resource_timeouts["default"]["read"]
    )
    delete = try(
      local.metadata.resource_timeouts["azurerm_subnet_route_table_association"]["delete"],
      local.metadata.resource_timeouts["default"]["delete"]
    )
  }
}