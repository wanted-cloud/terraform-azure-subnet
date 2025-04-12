resource "azurerm_network_security_group" "example" {
  name                = "test-security-group"
  location            = "northeurope"
  resource_group_name = "test"

  security_rule {
    name                       = "test"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

module "example" {
    depends_on = [ azurerm_network_security_group.example ]

    source = "../.."

    name = "example-subnet"
    resource_group_name = "test"
    virtual_network_name = "gl-vnet-test-001"
    address_prefixes = [ "10.0.2.0/24" ]

    network_security_group = azurerm_network_security_group.example.name

}