resource "citrixadc_lbvserver" "terraform_test_lb" {
    name        = var.lbvserver_name
    ipv46       = var.netscaler_private_vip
    port        = "80"
    servicetype = "HTTP"
    lbmethod    = "ROUNDROBIN"
}

resource "citrixadc_servicegroup" "ubuntu_servers" {
    servicegroupname = var.servicegroup_name
    lbvservers       = [citrixadc_lbvserver.terraform_test_lb.name]
    servicetype      = "HTTP"
    clttimeout       = "40"
    servicegroupmembers = formatlist("%v:80:1", var.apps_private_ip_addresses)
}