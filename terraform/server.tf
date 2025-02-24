
resource "hcloud_server" "homeserver" {
  name        = var.resource_name
  server_type = "cx22"
  image       = data.hcloud_image.this.id
  datacenter  = var.hcloud_datacenter

  user_data = templatefile("user_data.tftpl", {
    public_ssh_key = var.public_ssh_key,
    sb_user        = var.sb_user,
    sb_password    = var.sb_password,
    sb_domain      = var.sb_domain
  })
  backups  = false
  ssh_keys = [hcloud_ssh_key.this.id]
  public_net {
    ipv4_enabled = false
    ipv6_enabled = true
    ipv6         = hcloud_primary_ip.this.id
  }

}

resource "hcloud_primary_ip" "this" {
  type              = "ipv6"
  name              = var.resource_name
  datacenter        = var.hcloud_datacenter
  assignee_type     = "server"
  delete_protection = false
  auto_delete       = false
}

resource "hcloud_ssh_key" "this" {
  name       = var.resource_name
  public_key = var.public_ssh_key
}

data "hcloud_image" "this" {
  with_architecture  = "x86"
  most_recent        = true
  with_status        = ["available"]
  include_deprecated = false
  name               = "debian-12"
}
