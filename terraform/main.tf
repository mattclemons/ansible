terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.digitalocean_token
}

# Resource to add your local SSH public key to DigitalOcean
resource "digitalocean_ssh_key" "default" {
  name       = "id_rsa_key"  # Give it a descriptive name
  public_key = file("~/.ssh/id_rsa.pub")
}

# Droplet resource that uses the created SSH key
resource "digitalocean_droplet" "app_droplet" {
  image    = "ubuntu-22-04-x64"
  name     = var.droplet_name
  region   = var.region
  size     = "s-2vcpu-4gb"  # Adjust as needed
  ssh_keys = [digitalocean_ssh_key.default.id]  # Reference the SSH key ID
}

output "droplet_ip" {
  description = "Public IP address of the droplet"
  value       = digitalocean_droplet.app_droplet.ipv4_address
}

