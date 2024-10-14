data "azurerm_route_table" "this" {
  count = (var.route_table != "") ? 1 : 0
  name                = var.route_table
  resource_group_name = data.azurerm_resource_group.this.name
}

resource "azurerm_subnet_route_table_association" "this" {
  count = (var.route_table != "") ? 1 : 0
  subnet_id      = azurerm_subnet.this.id
  route_table_id = data_azurerm_route_table.this.id
}