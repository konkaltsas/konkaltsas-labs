# data source for existing resource_group
data "azurerm_resource_group" "terraform-resource-group" {
  name = var.resource_group_name
}

# resource "azurerm_resource_group" "terraform-resource-group" {
#   name     = var.resource_group_name
#   location = var.location
# }

