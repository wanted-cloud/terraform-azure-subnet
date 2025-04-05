variable "name" {
  description = "The name of the subnet."
  type        = string

  validation {
    error_message = local.metadata.validator_error_messages.subnet_name
    condition = can(
      regex(
        local.metadata.validator_expressions.subnet_name,
        var.name
      )
    )
  }
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the subnet."
  type        = string

  validation {
    error_message = local.metadata.validator_error_messages.resource_group_name
    condition = can(
      regex(
        local.metadata.validator_expressions.resource_group_name,
        var.resource_group_name
      )
    )
  }
}

variable "virtual_network_name" {
  description = "The name of the virtual network in which to create the subnet."
  type        = string

  validation {
    error_message = local.metadata.validator_error_messages.virtual_network_name
    condition = can(
      regex(
        local.metadata.validator_expressions.virtual_network_name,
        var.virtual_network_name
      )
    )
  }
}

variable "address_prefixes" {
  description = "The address prefixes to use for the subnet."
  type        = list(string)
}

variable "delegations" {
  description = "The list of delegations for the subnet."
  type = list(object({
    name = string
    service_delegation = object({
      name    = string
      actions = list(string)
    })
  }))
  default = []
}

variable "default_outbound_access_enabled" {
  description = "The default action for outbound traffic to the internet."
  type        = bool
  default     = true
}

variable "private_endpoint_network_policies" {
  description = "The network policies for the private endpoint."
  type        = string
  default     = "RouteTableEnabled"
}

variable "private_link_service_network_policies_enabled" {
  description = "The network policies for the private link service."
  type        = bool
  default     = true
}

variable "service_endpoints" {
  description = "The list of service endpoints for the subnet."
  type        = list(string)
  default     = []
}

variable "service_endpoint_policy_ids" {
  description = "The list of service endpoint policy IDs for the subnet."
  type        = list(string)
  default     = []
}

variable "route_table" {
  description = "The route table to associate with the subnet."
  type        = string
  default     = ""
}

variable "route_table_resource_group_name" {
  description = "The name of the resource group of the route table to associate with the subnet."
  type        = string
  default     = ""

  validation {
    error_message = local.metadata.validator_error_messages.route_table_resource_group_name
    condition = can(
      regex(
        local.metadata.validator_expressions.route_table_resource_group_name,
        var.route_table_resource_group_name
      )
    )
  }
}

variable "network_security_group" {
  description = "The network security group to associate with the subnet."
  type        = string
  default     = ""
}

variable "network_security_group_resource_group_name" {
  description = "The name of the resource group of the network security group to associate with the subnet."
  type        = string
  default     = ""

  validation {
    error_message = local.metadata.validator_error_messages.network_security_group_resource_group_name
    condition = can(
      regex(
        local.metadata.validator_expressions.network_security_group_resource_group_name,
        var.network_security_group_resource_group_name
      )
    )
  }
}

variable "nat_gateway" {
  description = "The NAT gateway to associate with the subnet."
  type        = string
  default     = ""
}

variable "nat_gateway_resource_group_name" {
  description = "The name of the resource group of the NAT gateway to associate with the subnet."
  type        = string
  default     = ""

  validation {
    error_message = local.metadata.validator_error_messages.nat_gateway_resource_group_name
    condition = can(
      regex(
        local.metadata.validator_expressions.nat_gateway_resource_group_name,
        var.nat_gateway_resource_group_name
      )
    )
  }
}