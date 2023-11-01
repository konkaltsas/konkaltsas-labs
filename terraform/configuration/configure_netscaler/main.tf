resource "citrixadc_nsip" "snip" {
    ipaddress = var.nsip
    type = "SNIP"
    netmask = "255.255.255.0"
}

resource "citrixadc_service" "tf_service1" {
    servicetype = "HTTP"
    name = "tf_service1"
    ipaddress = "${backend_server1_ip}"
    ip = "${backend_server1_ip}"
    port = "80"
    depends_on = [ citrixadc_nsip.snip ]
}

resource "citrixadc_service" "tf_service2" {
    servicetype = "HTTP"
    name = "tf_service2"
    ipaddress = "${backend_server2_ip}"
    ip = "${backend_server2_ip}"
    port = "80"
    depends_on = [ citrixadc_nsip.snip ]
}

resource "citrixadc_lbvserver" "tf_lbvserver" {
    ipv46       = "${adc_instance_vip}"
    name        = "tf_lbvserver"
    port        = 80
    servicetype = "HTTP"
    lbmethod    = "ROUNDROBIN"

    depends_on = [ citrixadc_nsip.snip ]
}

resource "citrixadc_lbvserver_service_binding" "tf_binding1" {
    name = citrixadc_lbvserver.tf_lbvserver.name
    servicename = citrixadc_service.tf_service1.name
    weight = 1
}

resource "citrixadc_lbvserver_service_binding" "tf_binding2" {
    name = citrixadc_lbvserver.tf_lbvserver.name
    servicename = citrixadc_service.tf_service2.name
    weight = 1
}