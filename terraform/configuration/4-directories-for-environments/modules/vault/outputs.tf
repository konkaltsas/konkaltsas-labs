# key vault outputs
output "vault_uri" {
  value = data.azurerm_key_vault.key_vault.vault_uri
}

output "azure_ns_username" {
  value     = data.azurerm_key_vault_secret.azure_ns_username.value
  sensitive = true
}

output "azure_ns_password" {
  value     = data.azurerm_key_vault_secret.azure_ns_password.value
  sensitive = true
}

output "Message" {
  value = "Thank you. Dev NetScaler has been configured."
}
