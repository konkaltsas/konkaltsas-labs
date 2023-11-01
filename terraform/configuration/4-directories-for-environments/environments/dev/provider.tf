terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.77.0"
    }
    citrixadc = {
      source = "citrix/citrixadc"
      version = "1.37.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "kk-tf-resource-group"
    storage_account_name = "kktfstorageaccount"
    container_name       = "kkdeploynsaztfstate"
    key                  = "kkconfigurensaztfcrkey"
  }
}

provider "azurerm" {
  # Configuration options
    features {}
}

# Use https and non default password
provider "citrixadc" {
  endpoint = format("https://%s",var.nsip)
  username = module.vault.azure_ns_username
  password = module.vault.azure_ns_password

  # Do not error due to non signed ADC TLS certificate
  # Can skip this if ADC TLS certificate is trusted
  insecure_skip_verify = true
}