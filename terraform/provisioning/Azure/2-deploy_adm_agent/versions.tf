terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.77.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "kk-tf-resource-group"
    storage_account_name = "kktfstorageaccount"
    container_name       = "kkdeploynsaztfstate"
    key                  = "kkdeployagentaztfcrkey"
  }
}

provider "azurerm" {
  # Configuration options
    features {}
}
