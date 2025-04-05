<!-- BEGIN_TF_DOCS -->
# wanted-cloud/terraform-azure-subnet

Terraform building block for provisioning an Azure Subnet and creating delegations or NAT, Route tables and Security groups assignments.

## Table of contents

- [Requirements](#requirements)
- [Providers](#providers)
- [Variables](#inputs)
- [Outputs](#outputs)
- [Resources](#resources)
- [Usage](#usage)
- [Contributing](#contributing)

## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.9)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (>=4.17.0)

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) (>=4.17.0)

## Required Inputs

The following input variables are required:

### <a name="input_address_prefixes"></a> [address\_prefixes](#input\_address\_prefixes)

Description: The address prefixes to use for the subnet.

Type: `list(string)`

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

Default: `[]`

### <a name="input_metadata"></a> [metadata](#input\_metadata)

Description: Metadata definitions for the module, this is optional construct allowing override of the module defaults defintions of validation expressions, error messages, resource timeouts and default tags.

Type:

```hcl
object({
    resource_timeouts = optional(
      map(
        object({
          create = optional(string, "30m")
          read   = optional(string, "5m")
          update = optional(string, "30m")
          delete = optional(string, "30m")
        })
      ), {}
    )
    tags                     = optional(map(string), {})
    validator_error_messages = optional(map(string), {})
    validator_expressions    = optional(map(string), {})
  })
```

Default: `{}`

### <a name="input_nat_gateway"></a> [nat\_gateway](#input\_nat\_gateway)

Description: The NAT gateway to associate with the subnet.

Type: `string`

Default: `""`

### <a name="input_nat_gateway_resource_group_name"></a> [nat\_gateway\_resource\_group\_name](#input\_nat\_gateway\_resource\_group\_name)

Description: The name of the resource group of the NAT gateway to associate with the subnet.

Type: `string`

Default: `""`

### <a name="input_network_security_group"></a> [network\_security\_group](#input\_network\_security\_group)

Description: The network security group to associate with the subnet.

Type: `string`

Default: `""`

### <a name="input_network_security_group_resource_group_name"></a> [network\_security\_group\_resource\_group\_name](#input\_network\_security\_group\_resource\_group\_name)

Description: The name of the resource group of the network security group to associate with the subnet.

Type: `string`

Default: `""`

### <a name="input_private_endpoint_network_policies"></a> [private\_endpoint\_network\_policies](#input\_private\_endpoint\_network\_policies)

Description: The network policies for the private endpoint.

Type: `string`

Default: `"RouteTableEnabled"`

### <a name="input_private_link_service_network_policies_enabled"></a> [private\_link\_service\_network\_policies\_enabled](#input\_private\_link\_service\_network\_policies\_enabled)

Description: The network policies for the private link service.

Type: `bool`

Default: `true`

### <a name="input_route_table"></a> [route\_table](#input\_route\_table)

Description: The route table to associate with the subnet.

Type: `string`

Default: `""`

### <a name="input_route_table_resource_group_name"></a> [route\_table\_resource\_group\_name](#input\_route\_table\_resource\_group\_name)

Description: The name of the resource group of the route table to associate with the subnet.

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

## Outputs

The following outputs are exported:

### <a name="output_subnet"></a> [subnet](#output\_subnet)

Description: n/a

## Resources

The following resources are used by this module:

- [azurerm_subnet.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) (resource)
- [azurerm_subnet_nat_gateway_association.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_nat_gateway_association) (resource)
- [azurerm_subnet_network_security_group_association.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) (resource)
- [azurerm_subnet_route_table_association.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_route_table_association) (resource)
- [azurerm_nat_gateway.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/nat_gateway) (data source)
- [azurerm_network_security_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/network_security_group) (data source)
- [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) (data source)
- [azurerm_route_table.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/route_table) (data source)
- [azurerm_virtual_network.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) (data source)

## Usage

> For more detailed examples navigate to `examples` folder of this repository.

Module was also published via Terraform Registry and can be used as a module from the registry.

```hcl
module "example" {
  source  = "wanted-cloud/subnet/azure"
  version = "x.y.z"
}
```

### Basic usage example

The minimal usage for the module is as follows:

```hcl
module "example" {
    source = "../.."

    name = "example"
    resource_group_name = "example"
    virtual_network_name = "example"
    address_prefixes = [  ]

}
```
## Contributing

_Contributions are welcomed and must follow [Code of Conduct](https://github.com/wanted-cloud/.github?tab=coc-ov-file) and common [Contributions guidelines](https://github.com/wanted-cloud/.github/blob/main/docs/CONTRIBUTING.md)._

> If you'd like to report security issue please follow [security guidelines](https://github.com/wanted-cloud/.github?tab=security-ov-file).
---
<sup><sub>_2025 &copy; All rights reserved - WANTED.solutions s.r.o._</sub></sup>
<!-- END_TF_DOCS -->