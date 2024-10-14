variable "name" {
  description = "The name of the subnet."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the subnet."
  type        = string
}

variable "virtual_network_name" {
  description = "The name of the virtual network in which to create the subnet."
  type        = string
}

variable "virtual_network_resource_group_name" {
  description = "The name of the resource group of the virtual network in which to create the subnet."
  type        = string
  default     = ""
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
}

variable "default_outbound_access_enabled" {
  description = "The default action for outbound traffic to the internet."
  type        = bool
  default     = true
}

variable "private_endpoint_network_policies" {
  description = "The network policies for the private endpoint."
  type        = string
  default     = "Disabled"
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
}