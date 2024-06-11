
output "dns_zone_id" {
  value = azurerm_dns_zone.dns_zone.id
}



output "dns_zone_name" {
  description = "The name of the DNS zone"
  value       = azurerm_dns_zone.main.name
}

output "subdomain_name" {
  description = "The name of the subdomain"
  value       = azurerm_dns_a_record.subdomain.name
}

output "machine_ip" {
  description = "The IP address associated with the subdomain"
  value       = azurerm_dns_a_record.subdomain.records[0]
}
