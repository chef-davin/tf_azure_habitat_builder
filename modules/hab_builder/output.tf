output "bldr_server_pub_ip" {
  description = "Public IP Address of the Hab Builder Server"
  value       = azurerm_linux_virtual_machine.builder_server.public_ip_address
}

output "bldr_server_pubip_fqdn" {
  description = "The actual FQDN of the public IP of the Hab Builder Server"
  value = azurerm_public_ip.builder_public_ip.fqdn
}
