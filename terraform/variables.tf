variable "hcloud_token" {
  type      = string
  sensitive = true
}

variable "hcloud_datacenter" {
  type = string
}

variable "public_ssh_key" {
  type = string
}

variable "resource_name" {
  type = string
}

variable "tofu_backend_encryption_passphrase" {
  type      = string
  sensitive = true
}

variable "public_ipv6_address" {
  type        = string
  description = "Personal IPV6 address to setup firewall"
}

variable "sb_user" {
  type        = string
  description = "User of Storage Box"
}

variable "sb_password" {
  type        = string
  sensitive   = true
  description = "PW for Storage Box"
}

variable "sb_domain" {
  type = string
}