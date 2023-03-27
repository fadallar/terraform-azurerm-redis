output "redis_id" {
  value       = azurerm_redis_cache.this.id
  description = "Redis instance id"
}

output "redis_name" {
  value       = azurerm_redis_cache.this.name
  description = "Redis instance name"
}

output "redis_hostname" {
  value       = azurerm_redis_cache.this.hostname
  description = "Redis instance hostname"
}

output "redis_ssl_port" {
  value       = azurerm_redis_cache.this.ssl_port
  description = "Redis instance SSL port"
}

output "redis_port" {
  value       = azurerm_redis_cache.this.port
  description = "Redis instance port"
}

output "redis_primary_access_key" {
  sensitive   = true
  value       = azurerm_redis_cache.this.primary_access_key
  description = "Redis primary access key"
}

output "redis_secondary_access_key" {
  sensitive   = true
  value       = azurerm_redis_cache.this.secondary_access_key
  description = "Redis secondary access key"
}

output "redis_private_static_ip_address" {
  value       = azurerm_redis_cache.this.private_static_ip_address
  description = "Redis private static IP address"
}

output "redis_sku_name" {
  value       = azurerm_redis_cache.this.sku_name
  description = "Redis SKU name"
}

output "redis_family" {
  value       = azurerm_redis_cache.this.family
  description = "Redis family"
}

output "redis_capacity" {
  value       = azurerm_redis_cache.this.capacity
  description = "Redis capacity"
}

output "redis_configuration" {
  sensitive   = true
  value       = azurerm_redis_cache.this.redis_configuration
  description = "Redis configuration"
}