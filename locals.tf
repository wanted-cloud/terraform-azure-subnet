locals {
  definitions = {
    validator_expressions = {
      subnet_name                                = "^.*$"
      resource_group_name                        = "^.*$"
      nat_gateway_resource_group_name            = "^.*$"
      network_security_group_resource_group_name = "^.*$"
      route_table_resource_group_name            = "^.*$"
      virtual_network_name                       = "^.*$"
    }
    validator_error_messages = {
      subnet_name                                = "The value of \"name\" must be a string following the displayed expression pattern..."
      resource_group_name                        = "The value of \"resource_group_name\" must be a string following the displayed expression pattern..."
      nat_gateway_resource_group_name            = "The value of \"nat_gateway_resource_group_name\" must be a string following the displayed expression pattern..."
      network_security_group_resource_group_name = "The value of \"network_security_group_resource_group_name\" must be a string following the displayed expression pattern..."
      route_table_resource_group_name            = "The value of \"route_table_resource_group_name\" must be a string following the displayed expression pattern..."
      virtual_network_name                       = "The value of \"virtual_network_name\" must be a string following the displayed expression pattern..."
    }
  }
}
