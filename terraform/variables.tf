variable "digitalocean_token" {
  description = "Your DigitalOcean API token"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "DigitalOcean region for the droplet"
  default     = "nyc3"
}

variable "droplet_name" {
  description = "Name of the DigitalOcean Droplet"
  default     = "test-droplet"
}

variable "ssh_key_ids" {
  description = "List of SSH key IDs for access"
  type        = list(string)
}

