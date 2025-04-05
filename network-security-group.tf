data "azurerm_network_security_group" "this" {
  count               = (var.network_security_group != "") ? 1 : 0
  name                = var.network_security_group
  resource_group_name = (var.network_security_group_resource_group_name != "") ? var.network_security_group_resource_group_name : var.resource_group_name
}

resource "azurerm_subnet_network_security_group_association" "this" {
  count                     = (var.network_security_group != "") ? 1 : 0
  subnet_id                 = azurerm_subnet.this.id
  network_security_group_id = data.azurerm_network_security_group.this[0].id
}