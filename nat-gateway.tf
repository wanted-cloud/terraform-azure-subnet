data "azurerm_nat_gateway" "this" {
  count               = (var.nat_gateway != "") ? 1 : 0
  name                = var.nat_gateway
  resource_group_name = (var.nat_gateway_resource_group_name != "") ? var.nat_gateway_resource_group_name : var.resource_group_name
}

resource "azurerm_subnet_nat_gateway_association" "this" {
  count          = (var.nat_gateway != "") ? 1 : 0
  subnet_id      = azurerm_subnet.this.id
  nat_gateway_id = data.azurerm_nat_gateway.this[0].id
}