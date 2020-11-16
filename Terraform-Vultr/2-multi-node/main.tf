
# SSH Key
resource "vultr_ssh_key" "this_ssh_key" {
  name = "this_ssh_key"
  ssh_key = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAvNg366oxkOhFAbNxhZrizBvi44FgklWMp6JktFWv0xZog1cACHSJ7LsqTKKXBRwH8lMhryw78fVXrhrdR6eQYPmBe25aefFKiXdYzYtQG8hhT5b6uQLfv5CJfR6QuZTWyTknqnSRDgUdthas/jcuhnQZyQ751CRIPtGaSCweZM+NcP+bRkLZMjssm/M64S+U9+KwGv1NvXbYxnGLiDOadOtHDhb9qi7EZgnYEMEmHO/XEbNKvYoicD9rnaNgU7q2s3UK03OKCLW5itRUMDKUQWPimjl65oOZp3oibkLJzs2seNuTM1HlXSsHt5B7fRgOxvRFKFKbcWvRad8GNZg+hw== amTR1"
}

# Create a web server
# Resource https://www.vultr.com/api/
resource "vultr_server" "this_server" {
    # number of server
    count = 3
    plan_id = "201"
    region_id = "40"
    os_id = "387"
    label = "this_server_label_${count.index +1}"
    tag = "this_server_tag_${count.index +1}"
    hostname = "this_server_hostname_${count.index +1}"
    user_data = "{'foo': true}"
    enable_ipv6 = true
    auto_backup = true
    # ddos_protection = true
    notify_activate = false

    # sh_key_ids = [vultr_ssh_key.this_ssh_key.id]
}

output "this_public_ip" {
    value = vultr_server.this_server.*.main_ip
}

output "user_name" {
    value = "root"
}

output "this_password" {
    value = vultr_server.this_server.*.default_password
}