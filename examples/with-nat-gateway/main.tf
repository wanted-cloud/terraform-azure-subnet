resource "azurerm_nat_gateway" "example" {
  name                    = "nat-gateway"
  location                = "northeurope"
  resource_group_name     = "test"
  sku_name                = "Standard"
  idle_timeout_in_minutes = 10
  zones                   = ["1"]
}

module "example" {
    depends_on = [ azurerm_nat_gateway.example ]

    source = "../.."

    name = "example-subnet"
    resource_group_name = "test"
    virtual_network_name = "gl-vnet-test-001"
    address_prefixes = [ "10.0.2.0/24" ]

    nat_gateway = azurerm_nat_gateway.example.name

}