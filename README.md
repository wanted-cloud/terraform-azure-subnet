<!-- BEGIN_TF_DOCS -->
# wanted-cloud/terraform-azure-subnet

Some descirption of the module.

## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.9)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (>=3.113.0)

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) (>=3.113.0)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [azurerm_subnet.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) (resource)
- [azurerm_subnet_route_table_association.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_route_table_association) (resource)
- [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) (data source)
- [azurerm_route_table.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/route_table) (data source)
- [azurerm_virtual_network.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) (data source)

## Required Inputs

The following input variables are required:

### <a name="input_address_prefixes"></a> [address\_prefixes](#input\_address\_prefixes)

Description: The address prefixes to use for the subnet.

Type: `list(string)`

### <a name="input_delegations"></a> [delegations](#input\_delegations)

Description: The list of delegations for the subnet.

Type:

```hcl
list(object({
    name = string
    service_delegation = object({
      name    = string
      actions = list(string)
    })
  }))
```

### <a name="input_name"></a> [name](#input\_name)

Description: The name of the subnet.

Type: `string`

### <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name)

Description: The name of the resource group in which to create the subnet.

Type: `string`

### <a name="input_virtual_network_name"></a> [virtual\_network\_name](#input\_virtual\_network\_name)

Description: The name of the virtual network in which to create the subnet.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_default_outbound_access_enabled"></a> [default\_outbound\_access\_enabled](#input\_default\_outbound\_access\_enabled)

Description: The default action for outbound traffic to the internet.

Type: `bool`

Default: `true`

### <a name="input_metadata"></a> [metadata](#input\_metadata)

Description: Module metadata object to give user possibility to override default module values.

Type:

```hcl
object({
    default_tags             = optional(map(string), {})
    resource_timeouts        = optional(map(map(string)), {})
    validator_error_messages = optional(map(string), {})
    validator_expressions    = optional(map(string), {})
  })
```

Default: `{}`

### <a name="input_private_endpoint_network_policies"></a> [private\_endpoint\_network\_policies](#input\_private\_endpoint\_network\_policies)

Description: The network policies for the private endpoint.

Type: `string`

Default: `"Disabled"`

### <a name="input_private_link_service_network_policies_enabled"></a> [private\_link\_service\_network\_policies\_enabled](#input\_private\_link\_service\_network\_policies\_enabled)

Description: The network policies for the private link service.

Type: `bool`

Default: `true`

### <a name="input_route_table"></a> [route\_table](#input\_route\_table)

Description: The route table to associate with the subnet.

Type: `string`

Default: `""`

### <a name="input_service_endpoint_policy_ids"></a> [service\_endpoint\_policy\_ids](#input\_service\_endpoint\_policy\_ids)

Description: The list of service endpoint policy IDs for the subnet.

Type: `list(string)`

Default: `[]`

### <a name="input_service_endpoints"></a> [service\_endpoints](#input\_service\_endpoints)

Description: The list of service endpoints for the subnet.

Type: `list(string)`

Default: `[]`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: Key value pairs of custom tags to be applied to the module resources.

Type: `map(string)`

Default: `{}`

### <a name="input_virtual_network_resource_group_name"></a> [virtual\_network\_resource\_group\_name](#input\_virtual\_network\_resource\_group\_name)

Description: The name of the resource group of the virtual network in which to create the subnet.

Type: `string`

Default: `""`

## Outputs

No outputs.

Created by WANTED.solutions s.r.o.
---
<sup><sub>_2024 &copy; All rights reserved - WANTED.solutions s.r.o. [<@wanted-solutions>](https://github.com/wanted-solutions)_</sub></sup>
<!-- END_TF_DOCS -->