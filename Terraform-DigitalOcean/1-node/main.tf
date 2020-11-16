# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option
variable "do_token" {}

# Create a new SSH key
resource "digitalocean_ssh_key" "test_ssh_key" {
  name       = "Terraform SSH Key"
  public_key = file("id_rsa.pub")

}

resource "digitalocean_droplet_snapshot" "web-snapshot" {
  droplet_id = digitalocean_droplet.web.id
  name       = "web-snapshot-01"
}

# Create a new Web Droplet in the nyc2 region
resource "digitalocean_droplet" "web" {
  image  = "ubuntu-18-04-x64"
  name   = "web-1"
  region = "sgp1"
  size   = "s-1vcpu-1gb"

  ssh_keys = [digitalocean_ssh_key.test_ssh_key.fingerprint]
}

# Output
output "this_user_name" {
    value = "root"
}

output "this_ip" {
    value = digitalocean_droplet.web.ipv4_address
}