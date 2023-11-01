data "azurerm_key_vault" "key_vault" {
  name                = "kk-tf-key-vault"
  resource_group_name = "kk-tf-resource-group"
}

data "azurerm_key_vault_secret" "azure_ns_username" {
  name         = "azure-ns-username"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}

data "azurerm_key_vault_secret" "azure_ns_password" {
  name         = "azure-ns-password"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}