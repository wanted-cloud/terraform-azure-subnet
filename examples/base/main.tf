module "example" {
    source = "../.."

    name = "example-subnet"
    resource_group_name = "test"
    virtual_network_name = "gl-vnet-test-001"
    address_prefixes = [ "10.0.2.0/24" ]

}