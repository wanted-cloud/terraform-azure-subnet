/**
 * # wanted-cloud/terraform-azure-subnet
 *
 * Terraform building block for provisioning an Azure Subnet and creating delegations or NAT, Route tables and Security groups assignments.
 *
 */
resource "azurerm_subnet" "this" {
  name                 = var.name
  resource_group_name  = data.azurerm_resource_group.this.name
  virtual_network_name = data.azurerm_virtual_network.this.name
  address_prefixes     = var.address_prefixes
  service_endpoints    = var.service_endpoints

  default_outbound_access_enabled               = var.default_outbound_access_enabled
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

  timeouts {
    create = try(
      local.metadata.resource_timeouts["azurerm_subnet"]["create"],
      local.metadata.resource_timeouts["default"]["create"]
    )
    read = try(
      local.metadata.resource_timeouts["azurerm_subnet"]["read"],
      local.metadata.resource_timeouts["default"]["read"]
    )
    update = try(
      local.metadata.resource_timeouts["azurerm_subnet"]["update"],
      local.metadata.resource_timeouts["default"]["update"]
    )
    delete = try(
      local.metadata.resource_timeouts["azurerm_subnet"]["delete"],
      local.metadata.resource_timeouts["default"]["delete"]
    )
  }
}