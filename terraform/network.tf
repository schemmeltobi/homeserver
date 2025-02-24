
resource "hcloud_firewall" "temporary" {
  name = "temporary"
  rule {
    direction  = "in"
    protocol   = "icmp"
    source_ips = [var.public_ipv6_address]
  }

  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = "any"
    source_ips = [var.public_ipv6_address]
  }
  rule {
    direction  = "in"
    protocol   = "udp"
    port       = "any"
    source_ips = [var.public_ipv6_address]
  }
}

resource "hcloud_firewall_attachment" "temporary" {
  firewall_id = hcloud_firewall.temporary.id
  server_ids  = [hcloud_server.homeserver.id]
}