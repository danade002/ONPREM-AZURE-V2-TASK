output "dns_zone_name" {
  value = var.dns_zone_name
}


# Output the subdomain name
output "subdomain_name" {
  description = "The name of the subdomain"
  value       = azurerm_dns_a_record.subdomain.name
}

# Output the machine IP
output "machine_ip" {
  description = "The IP address associated with the subdomain"
  value       = var.machine_ip
}
