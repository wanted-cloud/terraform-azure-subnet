resource "azurerm_route_table" "example" {
  name                = "example-route-table"
  location            = "northeurope"
  resource_group_name = "test"

  route {
    name           = "route"
    address_prefix = "10.1.0.0/16"
    next_hop_type  = "VnetLocal"
  }

}

module "example" {
    source = "../.."

    depends_on = [ azurerm_route_table.example ]

    name = "example-subnet"
    resource_group_name = "test"
    virtual_network_name = "gl-vnet-test-001"
    address_prefixes = [ "10.0.2.0/24" ]

    route_table = azurerm_route_table.example.name

}