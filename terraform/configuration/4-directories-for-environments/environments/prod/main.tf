module "vault" {
  source = "../../modules/vault"
  keyvault_ns_username_secret = var.keyvault_ns_username_secret
  keyvault_ns_password_secret = var.keyvault_ns_password_secret

}
module "lb" {
  source = "../../modules/lb"

  netscaler_private_vip = var.netscaler_private_vip
  lbvserver_name = var.lbvserver_name
  servicegroup_name = var.servicegroup_name
  apps_private_ip_addresses = var.apps_private_ip_addresses
}