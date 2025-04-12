output "subnet" {
  value = azurerm_subnet.this
}

output "nat_gateways" {
  value = azurerm_subnet_nat_gateway_association.this
}

output "network_security_groups" {
  value = azurerm_subnet_network_security_group_association.this
}

output "route_tables" {
  value = azurerm_subnet_route_table_association.this
}