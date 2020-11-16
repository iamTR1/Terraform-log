
# Create a web server
# Resource https://www.vultr.com/api/
resource "vultr_server" "this_server" {
    count = 3
    # Minimum 2GB RAM
    plan_id = "202"
    region_id = "25"
    os_id = "240"
    label = "this_server_label_${count.index +1}"
    tag = "this_server_tag_${count.index +1}"
    hostname = "this_server_hostname_${count.index +1}"
    user_data = "{'foo': true}"
    enable_ipv6 = true
    auto_backup = true
    # ddos_protection = true
    notify_activate = false
}

output "this_public_ip" {
    value = vultr_server.this_server.*.main_ip
}

output "user_name" {
    value = "Administrator"
}

output "this_password" {
    value = vultr_server.this_server.*.default_password
}