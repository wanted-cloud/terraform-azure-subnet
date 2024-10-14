/**
 * # wanted-cloud/terraform-azure-subnet
 *
 * Some descirption of the module.
 *
 */
 resource "azurerm_subnet" "this" {
  name                 = var.name
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = ["10.0.1.0/24"]
  service_endpoints = var.service_endpoints
  
  default_outbound_access_enabled = var.default_outbound_access_enabled
  private_link_service_network_policies_enabled = var.private_link_service_network_policies_enabled
  private_endpoint_network_policies             = var.private_endpoint_network_policies

  dynamic "delegation" {
    for_each = { for delegation in var.delegations : delegation.name => delegation } 
    content {
        name = delegation.value.name
        service_delegation {
            name    = delegation.value.service_delegation[0].name
            actions = delegation.value.service_delegation[0].actions
        }
    }
  }
  
}
