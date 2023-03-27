resource "azurerm_redis_firewall_rule" "redis_fw_rule" {
  for_each = var.authorized_cidrs
  name     = each.key

  redis_cache_name    = azurerm_redis_cache.this.name
  resource_group_name = var.resource_group_name

  start_ip = cidrhost(each.value, 0)
  end_ip   = cidrhost(each.value, -1)
}

resource "azurerm_private_endpoint" "this" {
  count               = var.enable_private_endpoint == true ? 1 : 0
  name                = format("pe-%s", local.name)
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.private_endpoint_subnet_id
  tags                = merge(var.default_tags, var.extra_tags)
  private_dns_zone_group {
    name                 = "rediscache-group"
    private_dns_zone_ids = [var.private_dns_zone_id]
  }

  private_service_connection {
    name                           = "rediscacheprivatelink"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_redis_cache.this.id
    subresource_names              = ["redisCache"]
  }
}