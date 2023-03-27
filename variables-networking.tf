variable "enable_private_endpoint" {
  description = "Enable private endpoint"
  type        = bool
  default     = true
}

variable "private_endpoint_subnet_id" {
  description = "Private Endpoint Subnet Id"
  type        = string
  default     = null
}

variable "private_dns_zone_id" {
  description = "Private DNS Zone Id"
  type        = string
  default     = null
}

variable "authorized_cidrs" {
  description = "Map of authorized cidrs"
  type        = map(string)
  default     = null
}
