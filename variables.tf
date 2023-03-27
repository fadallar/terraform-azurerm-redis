
variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "location" {
  description = "Azure region to use."
  type        = string
}

variable "location_short" {
  description = "Short string for Azure location."
  type        = string
}

variable "environment" {
  description = "Project environment."
  type        = string
}

variable "stack" {
  description = "Project stack name."
  type        = string
  validation {
    condition     = var.stack == "" || can(regex("^[a-z0-9]([a-z0-9-]*[a-z0-9])?$", var.stack))
    error_message = "Invalid variable: ${var.stack}. Variable name must start with a lowercase letter, end with an alphanumeric lowercase character, and contain only lowercase letters, digits, or a dash (-)."
  }
}

variable "capacity" {
  description = "Redis size: (Basic/Standard: 1,2,3,4,5,6) (Premium: 1,2,3,4)  https://docs.microsoft.com/fr-fr/azure/redis-cache/cache-how-to-premium-clustering"
  type        = number
  default     = 2
}

variable "sku_name" {
  description = "Redis Cache Sku name. Can be Basic, Standard or Premium"
  type        = string
  default     = "Premium"
}

variable "cluster_shard_count" {
  description = "Number of cluster shards desired"
  type        = number
  default     = 3
}

variable "redis_additional_configuration" {
  description = "Additional configuration for the Redis instance. Some of the keys are set automatically. See https://www.terraform.io/docs/providers/azurerm/r/redis_cache.html#redis_configuration for full reference."
  type = object({
    aof_backup_enabled              = optional(bool)
    aof_storage_connection_string_0 = optional(string)
    aof_storage_connection_string_1 = optional(string)
    enable_authentication           = optional(bool)
    maxmemory_reserved              = optional(number)
    maxmemory_delta                 = optional(number)
    maxmemory_policy                = optional(string)
    maxfragmentationmemory_reserved = optional(number)
    rdb_backup_enabled              = optional(bool)
    rdb_backup_frequency            = optional(number)
    rdb_backup_max_snapshot_count   = optional(number)
    rdb_storage_connection_string   = optional(string)
    notify_keyspace_events          = optional(string)
  })
  default = {}
}

variable "allow_non_ssl_connections" {
  description = "Activate non SSL port (6779) for Redis connection"
  type        = bool
  default     = false
}

variable "minimum_tls_version" {
  description = "The minimum TLS version"
  type        = string
  default     = "1.2"
}

variable "public_network_access_enabled" {
  description = "Enable public access"
  type        = bool
  default     = false
}

variable "private_static_ip_address" {
  description = "The Static IP Address to assign to the Redis Cache when hosted inside the Virtual Network. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "subnet_id" {
  description = "The ID of the Subnet within which the Redis Cache should be deployed. Only supported in Premium. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "data_persistence_enabled" {
  description = "Enable data persistence."
  type        = bool
  default     = true
}

variable "data_persistence_frequency_in_minutes" {
  description = "Data persistence snapshot frequency in minutes."
  type        = number
  default     = 60
}

variable "data_persistence_max_snapshot_count" {
  description = "Max number of data persistence snapshots."
  type        = number
  default     = null
}


variable "data_persistence_storage_account_tier" {
  description = "Replication type for the Storage Account used for data persistence."
  type        = string
  default     = "Premium"
}

variable "data_persistence_storage_account_replication" {
  description = "Replication type for the Storage Account used for data persistence."
  type        = string
  default     = "ZRS"
}

variable "redis_version" {
  description = "Redis version to deploy. Allowed values are 4 or 6"
  type        = number
  default     = 6
}

variable "zones" {
  description = "A list of a one or more Availability Zones, where the Redis Cache should be allocated."
  default     = null
  type        = list(number)
}

variable "patch_schedules" {
  description = "A list of Patch Schedule, Azure Cache for Redis patch schedule is used to install important software updates in specified time window."
  default     = []
  nullable    = false
  type = list(object({
    day_of_week        = string
    start_hour_utc     = optional(string)
    maintenance_window = optional(string)
  }))
}


variable "identity_ids" {
  description = "List of Identities assigned to the Redis Cache"
  type        = list(string)
  default     = []
}